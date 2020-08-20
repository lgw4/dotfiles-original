if test -d $HOME/.cabal/bin && ! contains $HOME/.cabal/bin PATH
    set -x PATH $HOME/.cabal/bin $PATH
end
