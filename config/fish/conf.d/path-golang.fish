if test -d /usr/local/go
    set -x GOROOT /usr/local/go
    path_prepend $GOROOT/bin
end

if test -d $HOME/Developer/go
    set -x GOPATH $HOME/Developer/go
else if test -d $HOME/devel/go
    set -x GOPATH $HOME/devel/go
end

if test $GOPATH
    and not contains $GOPATH/bin $PATH
    path_prepend $GOPATH/bin
end
