# ~/.bashrc.d/01-variables-defs.bash

# Set architecture flags
if [[ "${OS_KERNEL}" == "Darwin" ]]; then
    OPENSSL_PREFIX="/usr/local/opt/openssl"
    if [[ -d "${OPENSSL_PREFIX}" ]]; then
        export CFLAGS="-I${OPENSSL_PREFIX}/include"
        export CPPFLAGS="-I${OPENSSL_PREFIX}/include"
        export LDFLAGS="-L${OPENSSL_PREFIX}/lib"
    fi
fi

export EDITOR="vim"
