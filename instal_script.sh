#!/usr/bin/env bash

sudo pacman -Syu --noconfirm

echo "Installing pacman packages"
sudo pacman -S --needed --noconfirm - < packages.txt

echo "Installing flatpak apps"
while read app; do
    flatpak install -y flathub "$app"
done < flatpaks.txt

echo "Copying configs"
mkdir -p ~/.config
cp -r config/* ~/.config/

echo "Done"
