# -*- mode: sh; -*-

if [[ ! -v VIRTUAL_ENV ]]; then
    if [[ -d "/usr/local/go" ]]; then
        export GOROOT="/usr/local/go"
    fi

    GOROOT_BIN="${GOROOT}/bin"
    if [[ -d "${GOROOT_BIN}" ]] && [[ ":${PATH}:" != *":${GOROOT_BIN}:"* ]]; then
        export PATH="${GOROOT_BIN}:${PATH}"
    fi

    if [[ -d "${HOME}/Developer/go" ]]; then
        export GOPATH="${HOME}/Developer/go"
    elif [[ -d "${HOME}/devel/go" ]]; then
        export GOPATH="${HOME}/devel/go"
    fi

    GOPATH_BIN="${GOPATH}/bin"
    if [[ -d "${GOPATH_BIN}" ]] && [[ ":${PATH}:" != *":${GOPATH_BIN}:"* ]]; then
        export PATH="${GOPATH_BIN}:${PATH}"
    fi
fi
