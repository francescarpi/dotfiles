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
  "$HOME/.bin/"
  "/opt/homebrew/Cellar/openjdk/17.0.2/bin/"
  "$HOME/.cargo/bin"
  "/usr/local/opt/llvm/bin"
  "$HOME/.bun/bin"
  "/opt/podman/bin"
  "/usr/local/go/bin"
  "/opt/homebrew/opt/libpq/bin/"
  "$HOME/.lspservers/.venv/bin/"
  "$HOME/go/bin/"
  "$HOME/dev/mytime/mytime-go/bin"
)
export EDITOR=nvim
export LANG=es_ES.UTF-8
export LC_CTYPE=es_ES.UTF-8
export LC_ALL=es_ES.UTF-8
export WORKON_HOME="$HOME/.virtualenvs"
export HOMEBREW_PREFIX=$(brew --prefix)
export JAVA_HOME=/opt/homebrew/Cellar/openjdk/18/
export KUBECTX_IGNORE_FZF=1
export ANTIDOTE_HOME=~/.cache/antidote

if [ -f "$HOME/.ai.sh" ]; then
  # source it
  # shellcheck disable=SC1090
  source $HOME/.ai.sh
fi

export PATH="$PATH:$HOME/.lmstudio/bin"
