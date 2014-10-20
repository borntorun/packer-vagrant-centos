#!/bin/bash

# Remove Linux headers
# if you remove this, later on 'vagrant up' the vm, will install again on an update 
#yum -y remove gcc kernel-devel kernel-headers
yum -y remove kernel-devel

yum -y clean all

# Remove Virtualbox specific files
rm -rf /usr/src/vboxguest* /usr/src/virtualbox-ose-guest*
rm -rf *.iso *.iso.? /tmp/vbox /home/vagrant/.vbox_version

# Cleanup log files
#find /var/log -type f | while read f; do echo -ne '' > $f; done;

# remove under tmp directory
#rm -rf /tmp/*

#don't know if this necessary ...
#rm -f /etc/udev/rules.d/70-persistent-net.rules
#sed -i '/^UUID/d'   /etc/sysconfig/network-scripts/ifcfg-enp0s3
#sed -i '/^HWADDR/d' /etc/sysconfig/network-scripts/ifcfg-enp0s3


#This block credits to https://github.com/opscode/bento/blob/master/packer/scripts/common/minimize.sh
# Whiteout the swap partition to reduce box size 
# Swap is disabled till reboot 
readonly swapuuid=$(/sbin/blkid -o value -l -s UUID -t TYPE=swap)
readonly swappart=$(readlink -f /dev/disk/by-uuid/"$swapuuid")
/sbin/swapoff "$swappart"
dd if=/dev/zero of="$swappart" bs=1M || echo "dd exit code $? is suppressed" 
/sbin/mkswap -U "$swapuuid" "$swappart"
dd if=/dev/zero of=/EMPTY bs=1M
rm -f /EMPTY
# Block until the empty file has been removed, otherwise, Packer
# will try to kill the box while the disk is still full and that's bad
sync

#clean disk to reduce file size (this report an error to logging which is normal)
dd if=/dev/zero of=/EMPTY bs=1M
rm -rf /EMPTY
sync
