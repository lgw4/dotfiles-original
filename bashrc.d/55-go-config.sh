# ${HOME}/.bashrc.d/55-go-config.sh

if [ -d "/usr/local/go" ]; then
    export GOROOT="/usr/local/go"
fi

if [ -n "${GOROOT}" ]; then
    export PATH="${PATH}:${GOROOT}/bin"
fi

if [ -d "${HOME}/Developer/go" ]; then
    export GOPATH="${HOME}/Developer/go"
elif [ -d "${HOME}/devel/go" ]; then
    export GOPATH="${HOME}/devel/go"
fi

if [ -d "${GOPATH}/bin" ]; then
    export PATH="${PATH}:${GOPATH}/bin"
fi
