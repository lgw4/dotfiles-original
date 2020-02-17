if command -v pipx > /dev/null 2>&1; then
    autoload -U bashcompinit
    bashcompinit
    eval "$(register-python-argcomplete pipx)"
fi
