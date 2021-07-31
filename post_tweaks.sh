#!/bin/bash
sudo timedatectl set-timezone Asia/Ho_Chi_Minh
sudo systemctl enable systemd-timesyncd
echo "Enter hostname"
read hostname
sudo hostnamectl set-hostname $hostname
basehost="127.0.0.1 "
sudo bash -c 'echo "127.0.0.1 localhost" >>/etc/hosts'
sudo bash -c 'echo "$basehost$hostname" >>/etc/hosts'
sudo pacman -S --noconfirm xorg xorg-server mesa linux-firmware gvfs file-roller pulseaudio pavucontrol
sudo pacman -S --noconfirm alsa alsa-utils network-manager-applet bluez lightdm lightdm-gtk-greeter firefox konsole okular neofetch
sudo nano /etc/lightdm/lightdm.conf
sudo systemctl enable lightdm
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm

echo "Are you using intel or amd CPU ?"
echo "1---Intel"
echo "2---AMD"
read cpu_choice
case $cpu_choice in
1)
    sudo pacman -S --noconfirm intel-ucode
    ;;
2)
    sudo pacman -S --noconfirm amd-ucode
    ;;
esac

echo "Are you using nvidia graphic card ?"
echo "y---Yes"
echo "n---No"
read gpu_choice

if [ $gpu_choice = "y" ]; then
    sudo pacman -S --noconfirm nvidia nvidia-lts
fi

echo "Choose your desktop enviroment/windows manager:\n"
echo "1---XFCE4"
echo "2---KDE Plasma"
echo "3---GNOME"
echo "4---LXQT"
echo "5---CINNAMON"
echo "6---awesomeWM-1"
echo "7---awesomeWM-2"
echo "8---awesomeWM-3"
read de_choice
case $de_choice in
1)
    echo "Installing XFCE4(default)"
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
6)
    echo "Installing awesomeWM-1"
    yay -S --noconfirm awesome-git i3lock-fancy-git
    mkdir ~/.config/awesome
    git clone https://github.com/ntl870/awesome-config.git
    cd awesome-config
    cp * -r ~/.config/awesome
    sudo pacman -S --noconfirm rofi picom xclip
    ;;
7)
    echo "Installing awesomeWM-2"
    yay -S --noconfirm awesome-git picom-git
    mkdir ~/.config/awesome
    git clone https://github.com/ntl870/awesome-config-2.git
    cd awesome-config-2
    cp * -r ~/.config/awesome
    sudo pacman -S --noconfirm rofi xclip
    ;;
8)
    echo "Installing awesomeWM-3"
    yay -S --noconfirm awesome-git picom-ibhagwan-git i3lock-fancy-git
    mkdir ~/.config/awesome
    git clone https://github.com/ntl870/awesome-config-3.git
    cd awesome-config-3
    cp * -r ~/.config/awesome
    sudo pacman -S --noconfirm rofi xclip bluez-utils iw ttf-ubuntu-font-family
    ;;
esac
