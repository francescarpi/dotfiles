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
    VIRTUALENV="$HOME/.virtualenvs"

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

git_prune_branches() {
  echo "Branches to delete"
  git branch --merged | grep -v "\*" | grep -v "master" | grep -v "develop" | grep -v "staging"

  echo -n "Do you want to continue (y/n)? "
  read CONT

  if [ "$CONT" = "y" ]; then
    git branch --merged | grep -v "\*" | grep -v "master" | grep -v "develop" | grep -v "staging" | xargs -n 1 git branch -d
    echo "Done!"
  else
    echo "Aborted!"
  fi

}
