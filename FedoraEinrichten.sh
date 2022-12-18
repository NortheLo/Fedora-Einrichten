#!/bin/bash

if [ "$EUID" == 0 ]
	then dnf update -y
	rpm --import https://packages.microsoft.com/keys/microsoft.asc
	sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
	dnf install gparted code cargo neovim gnome-tweak-tool gnome-extensions-app kernel-devel gcc g++ alacarte virt-manager kicad kicad-packages3d -y && reboot
fi

echo "You have to use this script with root privileges!\n"

