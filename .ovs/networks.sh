#!/bin/bash

# Remove the HWADDR from eth1
sed -i /HWADDR/d /etc/sysconfig/network-scripts/ifcfg-eth1

# Remove udev rules
rm -f /etc/udev/rules.d/70-persistent-net.rules
mkdir /etc/udev/rules.d/70-persistent-net.rules
rm -rf /dev/.udev/
rm -f /lib/udev/rules.d/75-persistent-net-generator.rules

# Correct /etc/hosts to remove the entry for this host on eth1 used during the build
sed -i '/192.168.60.1/d' /etc/hosts


