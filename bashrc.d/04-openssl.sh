# ${HOME}./bashrc.d/04-openssl.sh

if [[ -d "/usr/local/opt/openssl@1.1/" ]]; then
    export CPPFLAGS="-I/usr/local/opt/openssl@1.1/include ${CPPFLAGS}"
    export LDFLAGS="-L/usr/local/opt/openssl@1.1/lib ${LDFLAGS}"
fi
