Vagrant.configure("2") do |config|

  config.vm.box = "mindpointgroup/windowsserver2019-winrm"
  config.vm.guest = :windows
  config.winrm.retry_limit = 30
  config.winrm.retry_delay = 120
  config.vm.provider "virtualbox" do |vb|
    vb.cpus = 2
    vb.memory = 8192
  end

  config.vm.communicator = "winrm"
  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "site.yml"
    # ansible.verbose = "vvvvv"
    ansible.host_vars = {
      "default" => { "ansible_winrm_scheme" => "http" }
    }
    ansible.raw_arguments = [
      "-e 'ansible_connection=winrm ansible_port=5985 ansible_winrm_server_cert_validation=ignore ansible_user=vagrant ansible_password=vagrant'"
    ]
  end
  config.vm.boot_timeout = 500
end
