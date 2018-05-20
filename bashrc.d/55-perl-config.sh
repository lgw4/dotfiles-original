# -*- mode: sh; -*-

# perlbrew
if [[ -e "${HOME}/.perlbrew/etc/bashrc" ]]; then
    export PERLBREW_ROOT="${HOME}/.perlbrew"
    source "${HOME}/.perlbrew/etc/bashrc"
fi
