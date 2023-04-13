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

# GPG
# https://www.howtogeek.com/427982/how-to-encrypt-and-decrypt-files-with-gpg-on-linux/
alias gpg_new_key="gpg --full-generate-key"
alias gpg_keys="gpg -k"
alias gpg_export="gpg --armor --output $1 --export $2"
alias gpg_import="gpg --import $1"
alias gpg_decrypt="gpg --decrypt $1"

# El flag 3 es opcional. Si no se pasa, se firma con la por defecto
alias gpg_encrypt="gpg --encrypt --sign $3 -r $1 $2"

# Virtualenvs
alias cdvirtualenv="cd $VIRTUAL_ENV"

# Wezterm
alias settabtitle="wezterm cli set-tab-title $1"
