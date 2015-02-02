#!/bin/bash
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
