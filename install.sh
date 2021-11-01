#!/bin/bash

# Symlinks
stow -t $HOME */

# Installing required zsh modules
git submodule update --init --recursive "zsh/.config/zsh/modules/z"
git submodule update --init --recursive "zsh/.config/zsh/modules/zsh-completions"
git submodule update --init --recursive "zsh/.config/zsh/modules/zsh-autosuggestions"

