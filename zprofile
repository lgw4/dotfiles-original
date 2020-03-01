for f in $HOME/.zprofile.d/**/*.zsh(N); do
    [[ -r "$f" ]] && source "$f"
done
