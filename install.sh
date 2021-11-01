#!/bin/bash

# Cleaning previous symlinks
rm $HOME/.tmux.conf
rm $HOME/.zshrc
rm $HOME/.ideavimrc
rm -Rf $HOME/.config/lvim
rm -Rf $HOME/.config/zsh

# Symlinks
stow -t $HOME */

# Installing required zsh modules
git submodule update --init --recursive "zsh/.config/zsh/modules/z"
git submodule update --init --recursive "zsh/.config/zsh/modules/zsh-completions"
git submodule update --init --recursive "zsh/.config/zsh/modules/zsh-autosuggestions"

