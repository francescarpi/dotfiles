workon() {
  # Firstly, we check if there are the folder .venv
  if [ -d ".venv" ]
  then
    source .venv/bin/activate
  else
    # Enable the python virtual environment according project name
    PROJECT_NAME=`basename "$PWD"`
    if [ $PROJECT_NAME = 'src' ]
    then
      PROJECT_NAME=$(basename "$(dirname $PWD)")
    fi
    source $WORKON_HOME/$PROJECT_NAME/bin/activate
  fi
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
