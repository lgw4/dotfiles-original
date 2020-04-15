# shellcheck shell=bash
if [[ ! -v VIRTUAL_ENV ]]; then
    if [[ -d /usr/local/go ]]; then
        export GOROOT="/usr/local/go"
        prepend_path "$GOROOT"/bin
    fi

    if [[ -d "$HOME"/Developer/go ]]; then
        export GOPATH="${HOME}/Developer/go"
    elif [[ -d "$HOME"/devel/go ]]; then
        export GOPATH="${HOME}/devel/go"
    fi

    if [[ -n "$GOPATH" ]]; then
        prepend_path "$GOPATH"/bin
    fi
fi
