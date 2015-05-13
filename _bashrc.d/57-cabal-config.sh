# ${HOME}/.bashrc.d/57-cabal-config.sh

if [ -d "${HOME}/.cabal/bin" ]; then
    export PATH="${PATH}:${HOME}/.cabal/bin"
fi
