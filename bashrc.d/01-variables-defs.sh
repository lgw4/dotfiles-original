# ${HOME}/.bashrc.d/00-variables-defs.sh

# Set architecture flags
if [[ "${OS_KERNEL}" == "Darwin" ]]; then
    OPENSSL_PREFIX="$(brew --prefix openssl)"
    if [[ -d "${OPENSSL_PREFIX}" ]]; then
        export CFLAGS="-I${OPENSSL_PREFIX}/include"
        export CPPFLAGS="-I${OPENSSL_PREFIX}/include"
        export LDFLAGS="-L${OPENSSL_PREFIX}/lib"
    fi
fi

export EDITOR="vim"
