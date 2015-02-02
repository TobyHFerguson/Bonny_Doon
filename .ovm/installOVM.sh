#!/bin/bash
mount | grep --quiet /mnt || { 
    mount -o loop /vagrant/ovm.iso /mnt 
}

/mnt/runInstaller.sh --config=/vagrant/.ovm/$(expr match $(cat /mnt/components/versionid) '\([0-9][0-9]*\.[0-9][0-9]*\).*')-config.yml -i install --assumeyes
