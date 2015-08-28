# ${HOME}/.bashrc.d/00-variables-defs.sh

# Set architecture flags
if [ "${OS_KERNEL}" == "Darwin" ]; then
    export ARCHFLAGS="-arch x86_64"
fi

export EDITOR="vim"

