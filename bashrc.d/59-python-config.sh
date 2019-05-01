# -*- mode: sh; -*-

# macOS current Python packages (be sure to create symlink)
PY_BIN="${HOME}/Library/Python/Current/bin"
if [[ ! -v VIRTUAL_ENV ]] && [[ "${OS_KERNEL}" == "Darwin" ]] && [[ -d "${PY_BIN}" ]] && [[ ":${PATH}:" != *":${PY_BIN}:"* ]]; then
    export PATH="${PY_BIN}:${PATH}"
fi

# Enable virtualenvwrapper
if command -v virtualenvwrapper.sh > /dev/null 2>&1; then
    if [[ -e "/usr/local/bin/python3" ]]; then
        export VIRTUALENVWRAPPER_PYTHON="/usr/local/bin/python3"
    fi
    if [[ "${OS_KERNEL}" == "Darwin" ]]; then
        export PROJECT_HOME="${HOME}/Developer/python"
    else
        export PROJECT_HOME="${HOME}/devel/python"
    fi
    export WORKON_HOME="${HOME}/.local/share/virtualenvs"
    export VIRTUALENVWRAPPER_HOOK_DIR="${WORKON_HOME}/_hooks"
    source "$(command -v virtualenvwrapper.sh)"
fi

# Enable pyenv
if [[ ! -v VIRTUAL_ENV ]]; then
    PYENV_BIN="${HOME}/.pyenv/bin"
    if [[ -d "${PYENV_BIN}" ]] && [[ ":${PATH}:" != *":${PYENV_BIN}:"* ]]; then
        export PATH="${PYENV_BIN}":"${PATH}"
        if command -v pyenv > /dev/null 2>&1; then
            eval "$(pyenv init -)"
            export PYENV_VIRTUALENV_DISABLE_PROMPT=1
        fi
    fi

fi
