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
