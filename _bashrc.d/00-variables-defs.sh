# ${HOME}/.bashrc.d/00-variables-defs.sh

# Set architecture flags
export ARCHFLAGS="-arch x86_64"

# Make subl editor, if available
if `which subl > /dev/null`; then
    export EDITOR="subl -n -w"
else
    export EDITOR="vim"
fi
