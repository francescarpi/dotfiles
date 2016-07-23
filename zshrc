export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:$HOME/.gem/ruby/2.3.0/bin"

export ZSH=~/.oh-my-zsh
ZSH_THEME="farpi"
plugins=(virtualenv)
source $ZSH/oh-my-zsh.sh

export WORKON_HOME=~/.virtualenvs
source /usr/bin/virtualenvwrapper.sh

export TERM="screen-256color"
export EDITOR="nvim"
export ANDROID_HOME="/home/farpi/Applications/android-sdk-linux"
export TERMINAL="terminator"

alias vtags='ctags --exclude=js --exclude=migrations --exclude=css --exclude=templates --exclude=node_modules --exclude=.js --exclude=static --python-kinds=-iv -R .'
# alias vim='nvim'

if [ -z "$DISPLAY" ] && [ $(tty) = /dev/tty1 ]; then
  startx
fi

if [ -z "$TMUX" ]; then
   mux term          
 fi     
