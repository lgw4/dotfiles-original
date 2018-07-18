# ${HOME}/.bashrc.d/00-variables-defs.sh

# Set architecture flags
if [[ "${OS_KERNEL}" == "Darwin" ]]; then
    export ARCHFLAGS="-arch x86_64"
    if [[ -d $(brew --prefix openssl) ]]; then
        export CFLAGS="-I$(brew --prefix openssl)/include"
        export CPPFLAGS="-I$(brew --prefix openssl)/include"
        export LDFLAGS="-L$(brew --prefix openssl)/lib"
    fi
fi

export EDITOR="vim"
