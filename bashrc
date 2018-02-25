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

# PS1
# sudo pacman -S bash-completion
source /usr/share/git/git-prompt.sh
PS1='\[$(tput setaf 2)\][\[$(tput setaf 6)\]\w\[$(tput setaf 2)\]]\[$(tput setaf 1)\]$(__git_ps1)\[$(tput setaf 7)\]\n◈ \[$(tput sgr0)\]'

# Virtualenvwrapper
source /usr/bin/virtualenvwrapper.sh

# Aliases
alias ll='ls -la --color'

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
source /home/farpi/.rvm/scripts/rvm
