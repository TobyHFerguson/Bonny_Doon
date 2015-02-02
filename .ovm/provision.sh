#!/bin/bash
# Provision according to the version id
trap "umount -f /mnt" EXIT
mount -o loop /vagrant/ovm.iso /mnt

case $(cat /mnt/components/versionid)
in
    3.2*) /vagrant/.ovm/3.2/provision.sh;;
    3.3*) /vagrant/.ovm/3.3/provision.sh;;
    *) echo "Unknown version of OVM: \"$(cat /mnt/components/versionid)\"";
       exit 1;
       ;;
esac
