#!/usr/bin/env zsh
fpath+=(/usr/local/share/zsh/site-functions /opt/homebrew/share/zsh/site-functions "${HOME}/.local/share/zsh/local-functions")
autoload -Uz compinit && compinit

for f in $HOME/.zshrc.d/**/*.zsh(N); do
    if [[ -r $f ]]; then
        source $f
    fi
done

if [[ -d ${HOMEBREW_ROOT} ]] && (( $+commands[brew] )); then
    export HOMEBREW_CASK_OPTS="--appdir=~/Applications"
fi

if (( $+commands[starship] )); then
    eval "$(starship init zsh)"
fi

if (( $+commands[starship] )); then
    if [[ -f /opt/homebrew/bin/starship ]]; then
        eval "$(/opt/homebrew/bin/starship init zsh)"
    else
        eval "$(starship init zsh)"
    fi
else
    PROMPT=$'\n%n@%m: %1~\n> '
fi

precmd_functions+=(set_win_title)
