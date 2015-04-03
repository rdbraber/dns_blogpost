VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.define :rac01 do |rac01_config|
    rac01_config.vm.box = "rchouinard/oracle-uek-65-x64"
    rac01_config.vm.hostname = "rac01.example.com"
    rac01_config.vm.network "private_network", ip: "192.168.20.101"
    rac01_config.vm.provision "shell", path: "configure_DNS.sh"
  end

  config.vm.define :rac02 do |rac02_config|
    rac02_config.vm.box = "rchouinard/oracle-70-x64"
    rac02_config.vm.hostname = "rac02.example.com"
    rac02_config.vm.network "private_network", ip: "192.168.20.102"
    rac02_config.vm.provision "shell", path: "configure_DNS.sh"
  end
end
