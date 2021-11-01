export path=(
  "/usr/local/bin"
  "/usr/local/sbin"
  "/bin"
  "/usr/bin"
  "/usr/sbin"
  "/sbin"
  "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/bin/"
  "/opt/homebrew/bin"
  "$HOME/.local/bin/"
)

export EDITOR=lvim

# Nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

export LANG=es_ES.UTF-8
export LC_CTYPE=es_ES.UTF-8
export LC_ALL=es_ES.UTF-8

# Arm
if [ -d "/opt/homebrew/bin" ]
then
	eval $(/opt/homebrew/bin/brew shellenv)
else
    # Intel
    if [ -d "/usr/local/Homebrew/bin" ]
    then
        eval $(/usr/local/Homebrew/bin/brew shellenv)
    fi
fi

# Virtualenv
export WORKON_HOME="$HOME/.virtualenvs"

# Google cloud
if [ -d "/opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk" ]
then
    source /opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc
    source /opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc  
fi

