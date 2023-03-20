# Configure the Azure provider
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 2.65"
    }
  }
  required_version = ">= 1.1.0"
}

provider "azurerm" {
  features {}
}

data "external" "win_account" {
  program = ["cat", "./sensitive_info.json"]
}

resource "azurerm_resource_group" "main" {
  name     = "${var.prefix}-${var.OS_version}-RG"
  location = var.location
  tags = {
    environment = var.tagname
  }
}

resource "azurerm_virtual_network" "main" {
  name                = "${var.prefix}-${var.OS_version}-network"
  address_space       = ["172.16.0.0/16"]
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  tags = {
    environment = var.tagname
  }
}

resource "azurerm_subnet" "internal" {
  name                 = "${var.prefix}-${var.OS_version}-intip"
  resource_group_name  = azurerm_resource_group.main.name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = ["172.16.101.0/24"]
}

resource "azurerm_public_ip" "main" {
  name                = "${var.prefix}-${var.OS_version}-pubip"
  location            = var.location
  resource_group_name = azurerm_resource_group.main.name
  allocation_method   = "Static"
  tags = {
    environment = var.tagname
  }
}

resource "azurerm_network_interface" "main" {
  name                = "${var.prefix}-${var.OS_version}-nic"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.internal.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.main.id
  }

  tags = {
    environment = var.tagname
  }

}

resource "azurerm_network_security_group" "secgroup" {
  name                = "${var.prefix}-${var.OS_version}-secgroup"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  security_rule {
    name                       = "default-allow-3389"
    priority                   = 1000
    access                     = "Allow"
    direction                  = "Inbound"
    destination_port_range     = 3389
    protocol                   = "*" # rdp uses both
    source_port_range          = "*"
    source_address_prefix      = "Internet"
    destination_address_prefix = "*"
  }
  security_rule {
    name                       = "default-allow-winrm"
    priority                   = 1001
    access                     = "Allow"
    direction                  = "Inbound"
    destination_port_range     = "5985-5986"
    protocol                   = "*" # rdp uses both
    source_port_range          = "*"
    source_address_prefix      = "Internet"
    destination_address_prefix = "*"
  }
  tags = {
    environment = var.tagname
  }
}

# Associate subnet and network security group 
resource "azurerm_subnet_network_security_group_association" "secgroup-assoc" {
  subnet_id                 = azurerm_subnet.internal.id
  network_security_group_id = azurerm_network_security_group.secgroup.id
}

resource "azurerm_windows_virtual_machine" "main" {
  name                = "${var.hostname}-${var.OS_version}"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  size                = var.system_size
  admin_username      = data.external.win_account.result.username
  admin_password      = data.external.win_account.result.password
  network_interface_ids = [
    azurerm_network_interface.main.id,
  ]

  source_image_reference {
    publisher = var.OS_publisher
    offer     = "WindowsServer"
    sku       = "${var.OS_version}-${var.system_release}"
    version   = "latest"
  }

  os_disk {
    storage_account_type = "Standard_LRS"
    caching              = "ReadWrite"
  }

  tags = {
    environment = var.tagname
  }
}

## Install the custom script VM extension to each VM. When the VM comes up,
## the extension will download the ConfigureRemotingForAnsible.ps1 script from GitHub
## and execute it to open up WinRM for Ansible to connect to it from Azure Cloud Shell.
## exit code has to be 0
resource "azurerm_virtual_machine_extension" "enablewinrm" {
  name                       = "enablewinrm"
  virtual_machine_id         = azurerm_windows_virtual_machine.main.id
  publisher                  = "Microsoft.Compute"     ## az vm extension image list --location eastus Do not use Microsoft.Azure.Extensions here
  type                       = "CustomScriptExtension" ## az vm extension image list --location eastus Only use CustomScriptExtension here
  type_handler_version       = "1.10"                  ## az vm extension image list --location eastus
  auto_upgrade_minor_version = true
  settings                   = <<SETTINGS
    {
      "fileUris": ["https://raw.githubusercontent.com/ansible/ansible/devel/examples/scripts/ConfigureRemotingForAnsible.ps1"],
      "commandToExecute": "powershell -ExecutionPolicy Unrestricted -File ConfigureRemotingForAnsible.ps1"
    }
SETTINGS
}

output "public_ip_address" {
  value = azurerm_public_ip.main.*.ip_address
}

// generate inventory file
resource "local_file" "inventory" {
  filename             = "./hosts.yml"
  directory_permission = "0755"
  file_permission      = "0644"
  content              = <<EOF
    # benchmark host
    all:
      hosts:
        ${var.hostname}:
          ansible_host: ${azurerm_public_ip.main.ip_address}
      vars:
        ansible_user: "${data.external.win_account.result.username}"
        ansible_password: "${data.external.win_account.result.password}"
        setup_audit: true
        run_audit: true
        system_is_ec2: true
        audit_git_version: devel
        win_skip_for_test: true
        ansible_connection: winrm
        ansible_winrm_server_cert_validation: ignore
        ansible_winrm_operation_timeout_sec: 120
        ansible_winrm_read_timeout_sec: 180
        # to keep ansible connections
        rule_9_2_1: false
        rule_18_3_1: false
        rule_2_3_1_1: false
    EOF
}
