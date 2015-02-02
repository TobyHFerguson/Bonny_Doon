# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|
  config.vm.box = "ol6u6-minimal-btrfs-uek"
  config.vm.hostname = "ovm.lab.net"
  config.vm.provision "packages", type: "shell", path: ".ovm/packages.sh"
  config.vm.provision "createOracle", type: "shell", path: ".ovm/createOracle.sh"
  config.vm.provision "installOVM", type: "shell", path: ".ovm/installOVM.sh"
  config.vm.provision "installConsole" type: "shell", path: ".ovm/installConsole.sh"
  config.vm.provider "virtualbox" do |v|
    # Recommended memory:
    # v.memory = 7680
    # This works: 
    v.memory=3584
  end

end


