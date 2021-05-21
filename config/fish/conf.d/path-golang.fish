if test -d "$HOME/Developer/go"
    set -x GOPATH $HOME/Developer/go
else if test -d "$HOME/devel/go"
    set -x GOPATH $HOME/devel/go
end

if test -n "$GOPATH"
    and not contains $GOPATH/bin $PATH
    path_prepend $GOPATH/bin
end
