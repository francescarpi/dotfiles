#!/bin/sh
echo "Setup work station..."

/opt/homebrew/bin/brew update
/opt/homebrew/bin/brew upgrade

/opt/homebrew/bin/brew install stow
/opt/homebrew/bin/brew install eza
/opt/homebrew/bin/brew install zoxide
/opt/homebrew/bin/brew install neovim
/opt/homebrew/bin/brew install wezterm
/opt/homebrew/bin/brew install font-fira-code-nerd-font
/opt/homebrew/bin/brew install python@3.13
/opt/homebrew/bin/brew install npm
/opt/homebrew/bin/brew install starship
/opt/homebrew/bin/brew install atuin
/opt/homebrew/bin/brew install fnm
/opt/homebrew/bin/brew install ripgrep
/opt/homebrew/bin/brew install antidote
/opt/homebrew/bin/brew install lazygit
/opt/homebrew/bin/brew install luarocks

npm install -g mcp-hub@latest

