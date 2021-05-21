# shellcheck shell=bash
if [[ ! -v VIRTUAL_ENV ]]; then
    if [[ -d "$HOME"/Developer/go ]]; then
        export GOPATH="${HOME}/Developer/go"
    elif [[ -d "$HOME"/devel/go ]]; then
        export GOPATH="${HOME}/devel/go"
    fi

    if [[ -n "$GOPATH" ]]; then
        path_prepend "$GOPATH"/bin PATH
    fi
fi
