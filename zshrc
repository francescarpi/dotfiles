export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:$HOME/.gem/ruby/2.3.0/bin"

export ZSH=~/.oh-my-zsh
ZSH_THEME="farpi"
plugins=(virtualenv)
source $ZSH/oh-my-zsh.sh

export WORKON_HOME=~/.virtualenvs
source /usr/bin/virtualenvwrapper.sh

export TERM="xterm-256color"
export EDITOR="vim"
export TERMINAL="terminator"

alias vtags='ctags --exclude=js --exclude=migrations --exclude=css --exclude=templates --exclude=node_modules --exclude=.js --exclude=static --python-kinds=-iv -R .'
alias tmux="tmux -2"

if [ -z "$DISPLAY" ] && [ $(tty) = /dev/tty1 ]; then
  startx
  # XKB_DEFAULT_LAYOUT=es sway
fi

alias cpumonitor="watch grep \"cpu MHz\" /proc/cpuinfo"
alias cputohigh="sudo cpupower frequency-set -g performance"
