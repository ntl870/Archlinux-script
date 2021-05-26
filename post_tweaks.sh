#!/bin/bash
timdatectl set-timezone Asia/Ho_Chi_Minh
systemctl enable sysdemd-timesyncd
echo "Enter hostname"
read hostname
hostnamectl set-hostname hostname
basehost = "127.0.0.1 "
echo "127.0.0.1 localhost" >>/etc/hosts
echo "$(basehost)$(hostname)" >>/etc/hosts
pacman -S intel-ucode xorg xorg-server nvidia-lts nvidia
pacman -S mesa