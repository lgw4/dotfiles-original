# ${HOME}/.bashrc.d/55-go-config.sh

if [ -d "${HOME}/Developer/go" ]; then
    export GOPATH="${HOME}/Developer/go"
    if [ -d "${GOPATH}/bin" ]; then
        export PATH="${PATH}:${GOPATH}/bin"
    fi
fi
