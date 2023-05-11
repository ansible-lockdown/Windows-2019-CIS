Vagrant.configure("2") do |config|

  # config.vm.box = "gusztavvargadr/windows-10"
  # config.vm.box = "./win10_ready"
  # config.vm.box = "StefanScherer/windows_2019"
  config.vm.box = "mindpointgroup/windowsserver2019-winrm"
  config.vm.guest = :windows
  config.winrm.retry_limit = 30
  config.winrm.retry_delay = 120
  config.vm.provider "virtualbox" do |vb|
    vb.cpus = 2
    vb.memory = 4096
    # vb.memory = 8192
  end
  config.vm.communicator = "winrm"
  config.vm.provision "ansible" do |ansible|
    # SITE.YML TO TEST CONNECTION TO BOX AFTER SETUP
    # ansible.playbook = "/Users/stephenw/Documents/Development/Testing (Ok If Deleted)/Windows10/site.yml"
    # STIG FOR REVISIONS
    ansible.playbook = "/Users/stephenw/Documents/Development/MrSteveRepo/Windows-2019-CIS/site.yml"
    # ansible.playbook = "/Users/georgen/Documents/Work/ControlWork/CIS/Windows-2016-CIS/site.yml"
    # ansible.playbook = "/Users/georgen/Documents/Work/ControlWork/CIS/Windows-2019-CIS/site.yml"
    # ansible.playbook = "/Users/georgen/Documents/Work/ControlWork/STIG/Windows-2019-STIG/site.yml"
    # ansible.playbook = "/Users/georgen/Documents/Work/ControlWork/STIG/Windows-2016-STIG/site.yml"
    # ansible.playbook = "/Users/georgen/Documents/Work/ControlWork/temp/Windows-2016-CIS/site.yml"
    ansible.verbose = "vvvvv"
    ansible.host_vars = {
      "default" => { "ansible_winrm_scheme" => "http" }
    }
    ansible.raw_arguments = [
      "-e 'ansible_connection=winrm ansible_port=5985 ansible_winrm_server_cert_validation=ignore ansible_user=vagrant ansible_password=vagrant'"
    ]
  end
  config.vm.boot_timeout = 500
end
