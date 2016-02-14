export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"

export ZSH=~/.oh-my-zsh
ZSH_THEME="farpi"
plugins=(virtualenv)
source $ZSH/oh-my-zsh.sh

export WORKON_HOME=~/.virtualenvs
source /usr/bin/virtualenvwrapper.sh

export TERM="screen-256color"
export EDITOR="vim"

alias vtags='ctags --exclude=js --exclude=migrations --exclude=css --exclude=templates --exclude=node_modules --exclude=.js --exclude=static --python-kinds=-iv -R .'
alias vim='nvim'
alias vf='vifm'

if [ -z "$DISPLAY" ] && [ $(tty) = /dev/tty1 ]; then
  startx
fi

[[ $- != *i* ]] && return
[[ -z "$TMUX" ]] && exec tmux
