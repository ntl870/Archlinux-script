#!/bin/bash
pacman -S --noconfirm linux linux-headers openssh nano linux-firmware
systemctl enable sshd
pacman -S --noconfirm networkmanager wpa_supplicant wireless_tools netctl dialog git
systemctl enable NetworkManager
mkinitcpio -p linux
mkinitcpio -p linux-lts
nano /etc/locale.gen
locale-gen
passwd
echo "Creating user, enter username"
read userName
useradd -m -g users -G wheel $userName
echo "Setting password for user"
passwd $userName
EDITOR=nano visudo
pacman -S --noconfirm grub efibootmgr dosfstools os-prober mtools
echo "Mount EFI partion"
 
