#!/bin/bash
# Provision for 3.3

# Prerequisites
# as per http://docs.oracle.com/cd/E50245_01/E50247/html/vmiug-manager-requirements.html#vmiug-manager-prerequisite
packages="zip unzip libaio perl"

rpm --quiet --query $packages || yum --quiet -y --disablerepo=* --enablerepo=*ol6_latest install $packages


# Disable IPv6, as recommended for OVM 3.3 here: http://docs.oracle.com/cd/E50245_01/E50247/html/vmiug-manager-requirements.html#vmiug-manager-network

if (($(cat /proc/sys/net/ipv6/conf/all/disable_ipv6) == 0))
then
    # IPv6 is enabled - disable it
    cat >/etc/sysctl.conf <<EOF

net.ipv6.conf.all.disable_ipv6 = 1
net.ipv6.conf.default.disable_ipv6 = 1
net.ipv6.conf.lo.disable_ipv6 = 1
EOF
    sysctl -p
fi


# Install OS prerequisites
(cd /mnt
 ./createOracle.sh
)

# Install the OVM Manager
/mnt/runInstaller.sh --config=/vagrant/.ovm/3.3/config.yml -i install --assumeyes

# Postinstall
# Install the console rpm (http://docs.oracle.com/cd/E50245_01/E50247/html/vmiug-manager-vncviewer-install.html)
rpm -Uvh /mnt/ovmcore-console-1.0-36.el6.noarch.rpm

