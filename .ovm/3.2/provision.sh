#!/bin/bash
# Provision for 3.2

# Prerequisites
# as per http://docs.oracle.com/cd/E35328_01/E35330/html/vmiug-manager-requirements.html#vmiug-manager-prerequisite
packages="unzip perl libaio"

rpm --quiet --query $packages || yum --quiet -y --disablerepo=* --enablerepo=*ol6_latest install $packages


# Install OS prerequisites
(cd /mnt
 ./createOracle.sh
)

# Install the OVM Manager
/mnt/runInstaller.sh --installtype=Simple --assumeyes --config=/vagrant/.ovm/3.2/3.2-config.yml

# Postinstall
# Install TightVNC
yum -y install tightvnc

# Clean up /etc/hosts to remove the hostname used during the build
sed -i '/127.0.0.1/s/ovm.lab.net ovm //' /etc/hosts
