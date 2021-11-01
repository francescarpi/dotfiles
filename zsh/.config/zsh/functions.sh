function j() {
  fname=$(declare -f -F _z)

  [ -n "$fname" ] || source "$HOME/.config/zsh/modules/z/z.sh"

  _z "$1"
}

function cdd() {
  cd "$(ls -d -- */ | fzf)" || echo "Invalid directory"
}

workon() {
    CURRENT_FOLDER=`basename "$PWD"`

    if [ -d "$HOME/virtualenvs" ]; then
        VIRTUALENV="$HOME/virtualenvs"
    fi

    if [ -d "$HOME/.virtualenvs" ]; then
        VIRTUALENV="$HOME/.virtualenvs"
    fi

    if [ $CURRENT_FOLDER = 'src' ]
    then
        cd ..
        PROJECT=`basename "$PWD"`
        cd src
    else
        PROJECT=`basename "$PWD"`
    fi

    source $VIRTUALENV/$PROJECT/bin/activate
}

