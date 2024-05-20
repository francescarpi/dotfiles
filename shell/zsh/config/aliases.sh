alias ls="ls --color -G"
alias ll="ls -lah"

# Postgres
alias psql="PGPASSWORD=postgres psql -h localhost -U postgres"
prdump() { pg_restore --username postgres --role apsl --no-owner --dbname $1 --host localhost $2 }
prsql() { psql --username apsl --host localhost --dbname $1 -f $2 }

# System
alias updatedb='sudo /usr/libexec/locate.updatedb'
alias clean_pycache='find . | grep -E "(__pycache__|\.pyc|\.pyo$)" | xargs rm -rf'
alias current_week='date +%U'

# vim
alias vim="nvim"
alias lsplogs="tail -f $HOME/.local/state/nvim/lsp.log"
alias masonlogs="tail -f $HOME/.local/state/nvim/mason.log"

# python
alias flakecheck="flake8 src/ --max-line-length 120 --exclude auth_migrations,migrations,node_modules,.venv"
alias blackcheck="black src/ --check  --extend-exclude \"/(\.mypy_cache|migrations|\.pytest_cache)/\"  --target-version py39"
alias blackapply="black src/ --extend-exclude \"/(\.mypy_cache|migrations|\.pytest_cache)/\"  --target-version py39"

# docker
alias d="docker-compose $1"
alias dps='docker ps --format "{{.ID}}\t{{.Names}}"'
alias kubectl='kubecolor'
ds() {
  docker exec -ti `docker ps | grep $1 | awk '{ print $1 }'` sh
}
dl() {
  docker logs -f `docker ps | grep $1 | awk '{ print $1 }'`
}
