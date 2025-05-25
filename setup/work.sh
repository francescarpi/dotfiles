#!/bin/sh
echo "Setup work station..."

brew update
brew upgrade

brew install stow
brew install eza
brew install zoxide
brew install neovim
brew install wezterm
brew install font-fira-code-nerd-font
brew install python@3.13
brew install python@3.11
brew install npm
brew install starship
brew install atuin
brew install fnm
brew install ripgrep
brew install antidote
brew install lazygit
brew install luarocks
brew install dotnet-sdk
brew install awscli
brew install redis

npm install -g mcp-hub@latest

echo "System installed successfully!"
