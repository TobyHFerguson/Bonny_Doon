#!/bin/bash -x
mount | grep --quiet /mnt || { 
    mount -o loop /vagrant/ovm.iso /mnt 
}

cd /mnt/
./createOracle.sh
