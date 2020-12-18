# shellcheck shell=zsh
if [[ ! -v VIRTUAL_ENV ]]; then
    if [[ -d /usr/local/go ]]; then
        export GOROOT="/usr/local/go"
        path=("$GOROOT"/bin $path[@])
        export PATH
    fi

    if [[ -d "$HOME"/Developer/go ]]; then
        export GOPATH="${HOME}/Developer/go"
    elif [[ -d "$HOME"/devel/go ]]; then
        export GOPATH="${HOME}/devel/go"
    fi

    if [[ -n "$GOPATH" ]]; then
        path=("$GOPATH"/bin $path[@])
        export PATH
    fi
fi
