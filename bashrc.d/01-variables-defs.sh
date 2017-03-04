# ${HOME}/.bashrc.d/00-variables-defs.sh

# Set architecture flags
if [ "${OS_KERNEL}" == "Darwin" ]; then
    export ARCHFLAGS="-arch x86_64"
    if [ -d /usr/local/opt/openssl ]; then
        export LDFLAGS="-L/usr/local/opt/openssl/lib"
        export CPPFLAGS="-I/usr/local/opt/openssl/include"
    fi
fi

export EDITOR="vim"
