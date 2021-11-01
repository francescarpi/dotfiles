#!/bin/bash

# Symlinks
stow -v */

# Installing required zsh modules
cd $HOME/.config/zsh

git submodule update --init --recursive "modules/z"
git submodule update --init --recursive "modules/zsh-completions"
git submodule update --init --recursive "modules/zsh-autosuggestions"

