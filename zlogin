for f in $HOME/.zlogin.d/**/*.zsh(N); do
    [[ -r "$f" ]] && source "$f"
done
