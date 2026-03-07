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

echo "Copying configs"
mkdir -p ~/.config
cp -r config/* ~/.config/

echo "Done"
