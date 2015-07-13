# ${HOME}/.bashrc.d/55-go-config.sh

if [ -d "/usr/local/opt/go" ]; then
    export GOROOT="/opt/local/opt/go"
elif [ -d "/usr/local/go" ]; then
    export GOROOT="/usr/local/go"
fi

if [ -n "${GOROOT}" ]; then
    export PATH="${PATH}:${GOROOT}/bin"
fi

if [ -d "${HOME}/Developer/go" ]; then
    export GOPATH="${HOME}/Developer/go"
    if [ -d "${GOPATH}/bin" ]; then
        export PATH="${PATH}:${GOPATH}/bin"
    fi
fi
