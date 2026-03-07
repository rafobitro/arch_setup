#!/usr/bin/env bash
set -e

echo "Updating system"
sudo sed -i '/\[multilib\]/,/Include/ s/^#//' /etc/pacman.conf
sudo pacman -Syu --noconfirm

echo "Installing pacman packages"
sudo pacman -S --needed --noconfirm - < packages.txt

echo "Installing Flatpak"
sudo pacman -S --needed --noconfirm flatpak

echo "Adding Flathub repository"
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

echo "Installing flatpak apps"
while read app; do
    flatpak install -y flathub "$app"
done < flatpaks.txt

echo "configurate yay"
git clone https://aur.archlinux.org/yay.git /tmp/yay
cd /tmp/yay
makepkg -si --noconfirm
cd -
rm -rf /tmp/yay


echo "Installing yay packages"
while read -r package; do
yay -S --noconfirm "$package"
done < yay_packages.txt


echo "Copying configs"
mkdir -p ~/.config
cp -r config/* ~/.config/

echo "compiling scripts"
cd ~/.config/hypr/scripts/
g++ opacity.cpp -o opacity
g++ touchpad_toggl.cpp -o touchpad_toggl
g++ waybar_switch.cpp -o waybar_switch
echo "cherack if executable"
chmod +x opacity touchpad_toggl waybar_switch


echo "Done! Nuclear reset successful."
