# shellcheck shell=zsh
for f in $HOME/.zshenv.d/**/*.zsh(N); do
    if [[ -r "$f" ]]; then
        source "$f"
    fi
done
