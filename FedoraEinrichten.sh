#!/bin/bash

if [ "$EUID" == 0 ]
	then dnf update -y
	rpm --import https://packages.microsoft.com/keys/microsoft.asc
	sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
	dnf install gparted code gfortran neovim gnome-tweak-tool gnome-extensions-app kernel-devel gcc g++ cmake alacarte virt-manager kicad kicad-packages3d lm_sensors -y 
	mkdir ~/Documents/Programming 
 	mkdir ~/Dosuments/Programming/C++ ~/Documents/Programming/C ~/Documents/Schematics ~/Documents/Programming/Shell
	systemctl enable sshd
	systemctl start sshd

	sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
	https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
	mkdir ~/.config/nvim  ~/.config/coc
	git clone https://github.com/NortheLo/vimrc
	mv vimrc/init.vim ~/.config/nvim/
 	mv vimrc/coc-settings.json ~/.config/coc
  	mv vimrc/.tmux.conf ~/.tmux.conf
   	rm -r vimrc

	echo "Everything should be set up now!" && reboot
fi

else
	echo "You have to use this script with root privileges!\n"
fi
