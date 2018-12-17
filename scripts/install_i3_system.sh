#!/bin/bash

echo "Installing system" packages...
sudo pacman -S python-pip playerctl python-colour python-netifaces python-dbus otf-font-awesome gsimplecal termite xf86-input-synaptics rofi sakura zsh

echo "Installing python libraries..."
sudo pip install git+https://github.com/enkore/i3pystatus.git fontawesome

echo "Configuring i3 window manager"
rm -Rf $HOME/.config/i3
ln -s $HOME/.dotfiles/i3 $HOME/.config/i3

echo "Configuring rofi"
rm -Rf $HOME/.config/rofi
ln -s $HOME/.dotfiles/rofi $HOME/.config/rofi

echo "Configuring sakura"
rm -Rf $HOOME/.config/sakura
ln -s $HOME/.dotfiles/sakura $HOME/.config/sakura

echo "Configuring duns"
rm -Rf $HOME/.config/dunst
ln -s $HOME/.dotfiles/dunst $HOME/.config/dunst

echo "Configuring compton"
rm -Rf $HOME/.config/compton.conf
ln -s $HOME/.dotfiles/compton.conf $HOME/.config/compton.conf

echo "Installing oh-my-zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
rm $HOME/.zshrc
ln -s $HOME/.dotfiles/zshrc $HOME/.zshrc
