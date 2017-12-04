# ${HOME}/.bashrc.d/70-postgresql-9.6-config.sh

if [ -d "/usr/local/opt/postgresql@9.6/bin" ]; then
    export PATH="${PATH}:/usr/local/opt/postgresql@9.6/bin"
fi
