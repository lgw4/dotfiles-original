if test -d /usr/local/go
    set -x GOROOT /usr/local/go
    if not contains $GOROOT/bin PATH
        set -x PATH $GOROOT/bin $PATH
    end
end

if test -d $HOME/Developer/go
    set -x GOPATH $HOME/Developer/go
else if test -d $HOME/devel/go
    set -x GOPATH $HOME/devel/go
end

if test $GOPATH && ! contains $GOPATH/bin PATH
    set -x PATH $GOPATH/bin $PATH
end
