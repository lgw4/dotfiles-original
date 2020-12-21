# shellcheck shell=zsh
fpath+=("${HOME}/.local/share/zsh/local-functions")
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

precmd_functions+=(set_win_title)
