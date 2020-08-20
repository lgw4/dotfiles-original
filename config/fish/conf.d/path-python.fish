if test -d $HOME/.pyenv
    set -x PYENV_ROOT $HOME/.pyenv
    path_prepend $PYENV_ROOT/bin
    if type -q pyenv && ! contains $PYENV_ROOT/shims PATH
        pyenv init - | source
        set -x PYENV_VIRTUALENV_DISABLE_PROMPT 1
    end
end
