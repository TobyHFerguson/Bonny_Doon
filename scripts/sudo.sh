ip route replace default dev eth0
cat >/etc/yum.repos.d/public-yum-ovs.repo <<EOF
[public_ovm3_latest]
name=Oracle VM Server 3 Latest
baseurl=http://public-yum.oracle.com/repo/OracleVM/OVM3/latest/x86_64/
gpgkey=http://public-yum.oracle.com/RPM-GPG-KEY-oracle-el5
gpgcheck=1
enabled=1
EOF

yum -y install sudo
