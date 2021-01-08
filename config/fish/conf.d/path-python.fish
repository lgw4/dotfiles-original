if test -d $HOME/.pyenv
    set -x PYENV_ROOT $HOME/.pyenv
    path_prepend $PYENV_ROOT/bin
    if type -q pyenv && ! contains $PYENV_ROOT/shims PATH
        status --is-interactive; and pyenv init - | source
        status --is-interactive; and pyenv virtualenv-init - | source
        set -x PYENV_VIRTUALENV_DISABLE_PROMPT 1
    end
end
