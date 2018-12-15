#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Path

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

# Tilix vte hack
if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
        source /etc/profile.d/vte.sh
fi
