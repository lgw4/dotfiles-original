# -*- mode: sh; -*-

# Enable pyenv
if [[ ! -v VIRTUAL_ENV ]]; then
    if [[ -d "${HOME}/.pyenv/bin" ]]; then
        add_to_path "${HOME}/.pyenv/bin"
    fi
    if command -v pyenv > /dev/null 2>&1 && [[ ":${PATH}:" != *":${HOME}/.pyenv/shims:"* ]]; then
        eval "$(pyenv init -)"
        export PYENV_VIRTUALENV_DISABLE_PROMPT=1
    fi
fi

# Enable virtualenvwrapper
if [[ -e "${HOME}/.local/bin/virtualenvwrapper.sh" ]]; then
    VIRTUALENVWRAPPER="${HOME}/.local/bin/virtualenvwrapper.sh"
fi

if [[ -v VIRTUALENVWRAPPER ]]; then
    PYENV_PYTHON3="$(pyenv which python3)"
    if [[ -x ${PYENV_PYTHON3} ]]; then
        export VIRTUALENVWRAPPER_PYTHON="${PYENV_PYTHON3}"
    elif [[ -x "/usr/local/bin/python3" ]]; then
        export VIRTUALENVWRAPPER_PYTHON="/usr/local/bin/python3"
    elif [[ -x "/usr/bin/python3" ]]; then
        export VIRTUALENVWRAPPER_PYTHON="/usr/bin/python3"
    fi
    if [[ -d "${HOME}/Developer/python" ]]; then
        export PROJECT_HOME="${HOME}/Developer/python"
    else
        export PROJECT_HOME="${HOME}/devel/python"
    fi
    export WORKON_HOME="${HOME}/.local/share/virtualenvs"
    export VIRTUALENVWRAPPER_HOOK_DIR="${WORKON_HOME}/_hooks"
    source "$(command -v ${VIRTUALENVWRAPPER})"
fi

# Enable pip completion
_pip_completion()
{
    COMPREPLY=( $( COMP_WORDS="${COMP_WORDS[*]}" \
                   COMP_CWORD=$COMP_CWORD \
                   PIP_AUTO_COMPLETE=1 $1 ) )
}
complete -o default -F _pip_completion pip
complete -o default -F _pip_completion pip3
