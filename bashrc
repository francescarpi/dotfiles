#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Path
export PATH="$PATH:$HOME/apps/pycharm/bin"
export PATH="$PATH:$HOME/apps/webstorm/bin"
export PATH="$PATH:$HOME/apps/rubymine/bin"
export PATH="$PATH:$HOME/apps/clion/bin"
export PATH="$PATH:$HOME/bin"
export PATH="$PATH:$HOME/.rbenv/bin"
export PATH="$PATH:$HOME/.rvm/bin"

source /home/farpi/.rvm/scripts/rvm

# PS1
# sudo pacman -S bash-completion
source /usr/share/git/git-prompt.sh
PS1='\[$(tput setaf 2)\][\[$(tput setaf 6)\]\w\[$(tput setaf 2)\]]\[$(tput setaf 1)\]$(__git_ps1)\[$(tput setaf 7)\]\n◈ \[$(tput sgr0)\]'

# Virtualenvwrapper
source /usr/bin/virtualenvwrapper.sh

# Aliases
alias ls='ls --color=auto'
alias ll='ls --color=auto -lsah'
alias git_remove_local_merged='git branch --merged | egrep -v "(^\*|master|dev)" | xargs git branch -d'

export WINEARCH=win32
