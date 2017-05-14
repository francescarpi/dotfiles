export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:$HOME/.gem/ruby/2.4.0/bin:$HOME/.bin/"

export ZSH=~/.oh-my-zsh
# ZSH_THEME="farpi"
plugins=(virtualenv)
source $ZSH/oh-my-zsh.sh

export WORKON_HOME=~/.virtualenvs
source /usr/bin/virtualenvwrapper.sh

alias tmux="tmux -2"
if [ "$TMUX" = "" ]; then
    export TERM="xterm-256color"
else
    export TERM="screen-256color"
    source "$HOME/.vim/bundle/gruvbox/gruvbox_256palette.sh"
fi

export EDITOR="vim"
export TERMINAL="terminator"

alias vtags='ctags --exclude=js --exclude=migrations --exclude=css --exclude=templates --exclude=node_modules --exclude=.js --exclude=static --python-kinds=-iv -R .'

alias cpumonitor="watch grep \"cpu MHz\" /proc/cpuinfo"
alias cputohigh="sudo cpupower frequency-set -g performance"
alias twoscreens='xrandr --output eDP1 --mode 1600x1080 --primary --pos -1920x0 --output HDMI1 --pos 0x0 --mode 1920x1200'

source ~/.gem/ruby/2.4.0/gems/tmuxinator-0.9.0/completion/tmuxinator.zsh

if [ -z "$DISPLAY" ] && [ $(tty) = /dev/tty1 ]; then
	startx
fi

