#!/bin/bash
sudo timedatectl set-timezone Asia/Ho_Chi_Minh
sudo systemctl enable systemd-timesyncd
echo "Enter hostname"
read hostname
sudo hostnamectl set-hostname $hostname
basehost="127.0.0.1 "
sudo echo "127.0.0.1 localhost" >>/etc/hosts
sudo echo "$basehost$hostname" >>/etc/hosts
sudo pacman -S --noconfirm intel-ucode xorg xorg-server nvidia-lts nvidia mesa linux-firmware gvfs
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
