workon() {
  folders=(".venv" "../.venv" "venv" ".env")
  for folder in ${folders[@]}; do
    if [ -d "$folder" ]
    then
      source "${folder}/bin/activate"
      return 0
    fi
  done
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

clean_nvim_config() {
  echo "Caution! This command will delete all nvim configuration."
  echo -n "Continue (y/n)? "
  read CONT

  if [ "$CONT" = "y" ]; then
    rm -Rf $HOME/.local/share/nvim
    rm -Rf $HOME/.local/state/nvim
    echo "Done!"
  else
    echo "Aborted!"
  fi
}

cx() { cd "$@" && l; }
