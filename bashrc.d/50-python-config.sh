# -*- mode: sh; -*-

# Farmobile pip configuration
if [[ "${HOSTNAME}" == "constellation" ]]; then
    export PIP_TRUSTED_HOST="pypi.farmobile.local"
    export PIP_EXTRA_INDEX_URL="http://pypi.farmobile.local/simple/"
fi

# macOS current Python packages (be sure to create symlink)
if [[ ! -v VIRTUAL_ENV ]]; then
    if [[ "${OS_KERNEL}" == "Darwin" ]]; then
        if [[ -d "${HOME}/Library/Python/Current/bin" ]]; then
            export PATH="${HOME}/Library/Python/Current/bin:${PATH}"
        fi
    fi
fi

# Enable virtualenvwrapper
if command -v virtualenvwrapper.sh > /dev/null 2>&1; then
    if [ -e "/usr/local/bin/python3" ]; then
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
