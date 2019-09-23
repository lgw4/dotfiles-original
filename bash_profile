# ~/.bash_profile file

# Source global definitions
if [ -f /etc/profile ]; then
	source /etc/profile
fi

# Source ${HOME}/.bashrc
if [[ -f "${HOME}/.bashrc" ]]; then
   source "${HOME}/.bashrc"
fi

# Run fortune, if available
if command -v fortune > /dev/null 2>&1; then
    echo
    fortune
fi
