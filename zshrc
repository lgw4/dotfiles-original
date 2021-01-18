#!/usr/bin/env zsh
fpath+=(/usr/local/share/zsh/site-functions /opt/homebrew/share/zsh/site-functions "$HOME"/.local/share/zsh/local-functions)
typeset -U fpath
autoload -Uz compinit && compinit
autoload bashcompinit && bashcompinit

for f in "$HOME"/.zshrc.d/**/*.zsh(N); do
    if [[ -r $f ]]; then
        source $f
    fi
done

if [[ -d "$HOMEBREW_ROOT" ]] && (( $+commands[brew] )); then
    export HOMEBREW_CASK_OPTS="--appdir=~/Applications"
fi

if (( $+commands[starship] )); then
    eval "$(starship init zsh)"
else
    PROMPT=$'\n%n@%m: %1~\n> '
fi

precmd_functions+=(set_window_title)

if (( $+commands[direnv] )); then
    eval "$(direnv hook zsh)"
fi
