#!/bin/bash
pacman -S linux linux-headers linux-lts linux-lts-headers
pacman -S nano
pacman -S openssh 
systemctl enable sshd
pacman -S networkmanager wpa_supplicant wireless_tools netctl
pacman -S dialog git
systemctl enable NetworkManager
mkinitcpio -p linux
mkinitcpio -p linux-lts
nano /etc/locale.gen
locale-gen
passwd
echo "Creating user, enter username"
read userName
useradd -m -g users -G wheel $(userName)
echo "Setting password for user"
passwd userName
EDITOR=nano visudo
pacman -S grub dosfstools os-prober mtools
pacman -S grub efibootmgr dosfstools os-prover mtools
echo "Mount EFI partion"
