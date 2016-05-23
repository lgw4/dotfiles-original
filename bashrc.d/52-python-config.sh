# ${HOME}/.bashrc.d/python_config.sh

# pythonz
if [ -s "${HOME}/.pythonz/etc/bashrc" ]; then
    source "${HOME}/.pythonz/etc/bashrc"
fi

# Python 2.7 packages
if [ -d "${HOME}/Library/Python/2.7/bin" ]; then
    export PATH="${HOME}/Library/Python/2.7/bin:${PATH}"
fi

# Python 3.5 packages
if [ -d "${HOME}/Library/Python/3.5/bin" ]; then
    export PATH="${HOME}/Library/Python/3.5/bin:${PATH}"
fi

# Set up virtualenvwrapper
if command -v virtualenvwrapper.sh > /dev/null 2>&1; then
    export VIRTUALENVWRAPPER_PYTHON=$(command -v python3)
    export WORKON_HOME="${HOME}/.local/share/virtualenvs"
    export PIP_VIRTUALENV_BASE="${WORKON_HOME}"
    export PROJECT_HOME="${HOME}/Developer/python"
    source $(command -v virtualenvwrapper.sh)
fi
