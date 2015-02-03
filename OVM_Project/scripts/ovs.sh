#!/bin/bash
# Correct the networking in OVS
# Vagrant doesn't know about master/slave relationships and bonds. Therefore we have to fix the networking.
cd /etc/sysconfig/network-scripts
echo substituting IPADDR from ifcfg-eth1 to ifcfg-bond0
sed -i "s/IPADDR.*/$(grep IPADDR ifcfg-eth1)/" ifcfg-bond0

echo setting up eth1 to be a slave to bond0
mv ifcfg-eth1{,.bak}
cat  >ifcfg-eth1 <<EOF
DEVICE=eth1
ONBOOT=yes
MASTER=bond0
SLAVE=yes
EOF

ifdown eth1; ifdown bond0; ifup bond0

