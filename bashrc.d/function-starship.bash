if [[ $OSTYPE == darwin* ]] && [[ -f /opt/homebrew/bin/starship ]]; then
    starship() {
        /opt/homebrew/bin/starship "$@"
    }
fi
