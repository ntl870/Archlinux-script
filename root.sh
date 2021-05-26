#!/bin/bash

echo "Setting up disks"
cfdisk
echo "Mount disk"
mkdir /mnt
mkdir /mnt/home
mkdir /mnt/boot
mkdir /mnt/boot/EFI
mkdir /etc
mkdir /etc/fstab
echo "genfstab -U /mnt >> /mnt/etc/fstab"
echo "pacstrap -i /mnt base base-devel"
echo "arch-chroot /mnt"