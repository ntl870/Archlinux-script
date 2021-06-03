#!/bin/bash
sudo timedatectl set-timezone Asia/Ho_Chi_Minh
sudo systemctl enable systemd-timesyncd
echo "Enter hostname"
read hostname
sudo hostnamectl set-hostname $hostname
basehost="127.0.0.1 "
sudo echo "127.0.0.1 localhost" >>/etc/hosts
sudo echo "$basehost$hostname" >>/etc/hosts
sudo pacman -S --noconfirm intel-ucode xorg xorg-server nvidia-lts nvidia mesa linux-firmware gvfs file-roller pulseaudio pavucontrol alsa alsa-utils network-manager-applet bluez lightdm lightdm-gtk-greeter firefox konsole okular
sudo nano /etc/lightdm/lightdm.conf
sudo systemctl enable lightdm
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

echo "Choose your desktop enviroment:\n"
echo "1---XFCE4"
echo "2---KDE Plasma"
echo "3---GNOME"
echo "4---LXQT"
echo "5---CINNAMON"
read choice
case $choice in
1)
    echo "Installing XFCE4"
    sudo pacman -S --noconfirm xfce4 xfce4-goodies
    ;;
2)
    echo "Installing KDE Plasma"
    sudo pacman -S --noconfirm plasma kde-applications
    ;;
3)
    echo "Installing GNOME"
    sudo pacman -S --noconfirm gnome
    ;;
4)
    echo "Installing LXQT"
    sudo pacman -S --noconfirm lxqt xdg-utils ttf-freefont sddm
    sudo pacman -S --noconfirm libpulse libstatgrab libsysstat lm_sensors oxygen-icons pavucontrol-qt
    ;;
5)
    echo "Installing CINNAMON"
    sudo pacman -S cinnamon
    ;;
esac
