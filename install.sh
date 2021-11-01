#!/bin/bash

# Symlinks
echo "Installing symlinks..."
stow -t $HOME */

# Installing required zsh modules
if [ $? -eq 0 ]; then
  echo "Pulling submodules..."
  git submodule update --init --recursive "zsh/.config/zsh/modules/z"
  git submodule update --init --recursive "zsh/.config/zsh/modules/zsh-completions"
  git submodule update --init --recursive "zsh/.config/zsh/modules/zsh-autosuggestions"
fi

echo "Done!"

