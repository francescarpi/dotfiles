export ZSH=~/.oh-my-zsh
ZSH_THEME="farpi"
plugins=(virtualenv)
export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"
source $ZSH/oh-my-zsh.sh
# export TERM="xterm-256color"
export TERM="screen-256color"
export WORKON_HOME=~/.virtualenvs
export EDITOR="vim"
source /usr/bin/virtualenvwrapper.sh

alias vtags='ctags --exclude=js --exclude=migrations --exclude=css --exclude=templates --exclude=node_modules --exclude=.js --exclude=static --python-kinds=-iv -R .'
alias vim='nvim'
alias vf='vifm'

if [ -z "$DISPLAY" ] && [ $(tty) = /dev/tty1 ]; then
  startx
fi
