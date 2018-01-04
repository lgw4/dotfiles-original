# ${HOME}/.bashrc.d/50-python_config.sh

# macOS current Python packages (be sure to create symlink)
if [ -d "${HOME}/Library/Python/Current/bin" ]; then
    export PATH="${PATH}:${HOME}/Library/Python/Current/bin"
fi

# macOS legacy Python packages (be sure to create symlink)
if [ -d "${HOME}/Library/Python/Legacy/bin" ]; then
    export PATH="${PATH}:${HOME}/Library/Python/Legacy/bin"
fi

# pythonz
[[ -s ${HOME}/.pythonz/etc/bashrc ]] && source ${HOME}/.pythonz/etc/bashrc

# Enable virtualenvwrapper
if command -v virtualenvwrapper.sh > /dev/null 2>&1; then
    export WORKON_HOME="${HOME}/.local/share/virtualenvs"
    export PROJECT_HOME="${HOME}/Developer/python"
    export VIRTUALENVWRAPPER_PYTHON="/usr/local/bin/python3"
    export VIRTUALENVWRAPPER_VIRTUALENV="$(which virtualenv)"
    export VIRTUALENVWRAPPER_VIRTUALENV_ARGS="--no-site-packages"
    export VIRTUALENVWRAPPER_HOOK_DIR="${WORKON_HOME}/.hooks"
    source "$(which virtualenvwrapper.sh)"
fi
