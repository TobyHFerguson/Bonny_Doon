yum -y clean all
rm -rf VBoxGuestAdditions_*.iso
rm -rf /tmp/rubygems-*
dd if=/dev/zero of=/EMPTY bs=1M
sync
sync
sync
rm -f /EMPTY

