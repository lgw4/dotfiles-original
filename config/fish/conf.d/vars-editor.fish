if type -q code && ! test $SSH_CONNECTION
    set -x EDITOR code
else
    set -x EDITOR vim
end
