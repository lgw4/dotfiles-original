# shellcheck shell=bash
if [[ ! -v VIRTUAL_ENV ]]; then
    if [[ -d /usr/local/go ]]; then
        export GOROOT="/usr/local/go"
        path_prepend "$GOROOT"/bin PATH
    fi

    if [[ -d "$HOME"/Developer/go ]]; then
        export GOPATH="${HOME}/Developer/go"
    elif [[ -d "$HOME"/devel/go ]]; then
        export GOPATH="${HOME}/devel/go"
    fi

    if [[ -n "$GOPATH" ]]; then
        path_prepend "$GOPATH"/bin PATH
    fi
fi
