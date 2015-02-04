# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|
  config.vm.box = "ol6u6-minimal-btrfs-uek"
  config.vm.hostname = "ovm.lab.net"
  config.vm.provision "shell", path: ".ovm/provision.sh"
  config.vm.provider "virtualbox" do |v|
    # Recommended memory:
    v.memory = 8200
    # This works for 3.3.1 - so far 3.2.1 has failed.: 
#    v.memory=3584
  end

end


