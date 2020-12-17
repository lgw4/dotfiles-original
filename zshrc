# shellcheck shell=zsh
for f in $HOME/.zshrc.d/**/*.zsh(N); do
    if [[ -r "$f" ]]; then
        source "$f"
    fi
done

if (( $+commands[starship] )); then
    eval "$(starship init zsh)"
fi
