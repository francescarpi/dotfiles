#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Path
export PATH="$PATH:$HOME/apps/pycharm/bin"
export PATH="$PATH:$HOME/apps/WebStorm/bin"
export PATH="$PATH:$HOME/bin"

# PS1
# sudo pacman -S bash-completion
source /usr/share/git/git-prompt.sh
PS1='\[$(tput setaf 2)\][\[$(tput setaf 6)\]\w\[$(tput setaf 2)\]]\[$(tput setaf 1)\]$(__git_ps1)\[$(tput setaf 7)\]\n◈ \[$(tput sgr0)\]'

# Virtualenvwrapper
source /usr/bin/virtualenvwrapper.sh

# Aliases
alias ll='ls -la --color'
