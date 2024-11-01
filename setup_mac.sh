#!/bin/bash

echo "Setting symlink for dotfiles"
files=$(find ./mac -type f -name "setup.sh" -perm -u=x)
for file in $files; do
(
    dir=$(dirname "$file")
    cd "$dir" || exit
    echo "Runing $file in $dir"
    ./setup.sh
)
done

echo "Checking system packages"
system_packages=(eza zoxide antidote atuin fnm starship)
for pkg in "${system_packages[@]}"; do
    echo -n "Checking $pkg..."
    if brew ls --versions $pkg > /dev/null; then
        echo " installed"
    else
        echo " not installed. Installing..."
        brew install $pkg
    fi
done

