# shellcheck shell=zsh
if (( $+commands[code] )) && [[ ! -v SSH_CONNECTION ]]; then
    export EDITOR="code"
else
    export EDITOR="vim"
fi
