# ${HOME}/.bash_profile file

# Run screenfetch, if available
if command -v screenfetch > /dev/null 2>&1; then
    if command -v lsb_release > /dev/null 2>&1; then
        OS_NAME=$(lsb_release -si)
    fi
    echo
    if [ -z "${OS_NAME}" ]; then
        screenfetch
    else
        screenfetch -D "${OS_NAME}"
    fi
fi

# Run fortune, if available
if command -v fortune > /dev/null 2>&1; then
    echo
    fortune
fi

# Source ${HOME}/.bashrc
if [ -f "${HOME}/.bashrc" ]; then
   source "${HOME}/.bashrc"
fi
