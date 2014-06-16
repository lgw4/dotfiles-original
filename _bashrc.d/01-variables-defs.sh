# ${HOME}/.bashrc.d/00-variables-defs.sh

# Set architecture flags
export ARCHFLAGS="-arch x86_64"

# Make subl editor, if available
if `which subl > /dev/null`; then
    export EDITOR="subl -n -w"
else
    export EDITOR="vim"
fi

# Enable Homebrew GitHub API token, if available
if [ -e ${HOME}/.homebrew/00-homebrew-github-api-token.sh ]; then
    source ${HOME}/.homebrew/00-homebrew-github-api-token.sh
fi
