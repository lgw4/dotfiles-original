# -*- mode: sh; -*-

if [[ "${LOGIN_SHELL}" == "True" ]]; then
    # macOS current Python packages (be sure to create symlink)
    if [[ -d "${HOME}/Library/Python/Current/bin" ]]; then
        export PATH="${HOME}/Library/Python/Current/bin:${PATH}"
    fi

    # macOS legacy Python packages (be sure to create symlink)
    if [[ -d "${HOME}/Library/Python/Legacy/bin" ]]; then
        export PATH="${PATH}:${HOME}/Library/Python/Legacy/bin"
    fi
fi

# Enable virtualenvwrapper
if command -v virtualenvwrapper.sh > /dev/null 2>&1; then
    if [ -e "/usr/local/bin/python3" ]; then
        export VIRTUALENVWRAPPER_PYTHON="/usr/local/bin/python3"
    fi
    export PROJECT_HOME="${HOME}/Developer/python"
    export WORKON_HOME="${HOME}/.local/share/virtualenvs"
    source "$(command -v virtualenvwrapper.sh)"
fi
