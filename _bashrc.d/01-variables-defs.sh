# ${HOME}/.bashrc.d/00-variables-defs.sh

# Set architecture flags
if [ "${OS_KERNEL}" == "Darwin" ]; then
    export ARCHFLAGS="-arch x86_64"
fi

# Make MacVim the default visual editor, if available
if [ "${OS_KERNEL}" == "Darwin" ] && [ `command -v mvim` ] ; then
    export VISUAL="mvim --nofork"
fi

export EDITOR="vim"

# Enable Homebrew GitHub API token, if available
if [ "${OS_KERNEL}" == "Darwin" ] \
    && [ -e "${HOME}/.homebrew/00-homebrew-github-api-token.sh" ]; then
        source "${HOME}/.homebrew/00-homebrew-github-api-token.sh"
fi
