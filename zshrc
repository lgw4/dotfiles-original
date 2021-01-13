if command -v starship >/dev/null 2>&1; then
    if [[ -f /opt/homebrew/bin/starship ]]; then
        eval "$(/opt/homebrew/bin/starship init zsh)"
    else
        eval "$(starship init zsh)"
    fi
else
    PROMPT=$'\n%n@%m: %1~\n> '
fi
