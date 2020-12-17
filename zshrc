# shellcheck shell=zsh
if (( $+commands[starship] )); then
    eval "$(starship init zsh)"
fi
