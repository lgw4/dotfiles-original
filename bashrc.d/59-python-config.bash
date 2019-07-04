# -*- mode: sh; -*-

# macOS current Python packages (be sure to create symlink)
if [[ ! -v VIRTUAL_ENV ]] && [[ "${OS_KERNEL}" == "Darwin" ]]; then
    add_to_path "${HOME}/Library/Python/Current/bin"
fi

# Enable virtualenvwrapper
if command -v virtualenvwrapper.sh > /dev/null 2>&1; then
    if command -v pyenv > /dev/null 2>&1; then
        export VIRTUALENVWRAPPER_PYTHON="$(pyenv which python3)"
    else
        export VIRTUALENVWRAPPER_PYTHON="$(command -v python3)"
    fi
    if [[ -d "${HOME}/Developer/python" ]]; then
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
    add_to_path "${HOME}/.pyenv/bin"
    if command -v pyenv > /dev/null 2>&1 && [[ ":${PATH}:" != *":${HOME}/.pyenv/shims:"* ]]; then
        eval "$(pyenv init -)"
        export PYENV_VIRTUALENV_DISABLE_PROMPT=1
    fi
fi
