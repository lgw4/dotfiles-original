# ${HOME}/.bash_profile file

# Source ${HOME}/.bashrc
if [ -f "${HOME}/.bashrc" ]; then
   source "${HOME}/.bashrc"
fi

# Run fortune, if available
if command -v fortune > /dev/null 2>&1; then
    echo
    fortune
fi
