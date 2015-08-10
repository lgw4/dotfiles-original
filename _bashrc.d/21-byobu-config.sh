# ${HOME}/.bashrc.d/21-byobu-config.sh

if [ -e /usr/local/bin/byobu ]; then
    export BYOBU_PREFIX="$(brew --prefix)"
fi
