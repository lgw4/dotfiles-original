# ${HOME}/.bashrc.d/python_config.sh

# MacPorts Python 2.7 user installs
if [ -d "${HOME}/Library/Python/2.7/bin" ]; then
    export PATH="${HOME}/Library/Python/2.7/bin:${PATH}"
fi

# MacPorts Python 3.4 user installs
if [ -d "${HOME}/Library/Python/3.4/bin" ]; then
    export PATH="${HOME}/Library/Python/3.4/bin:${PATH}"
fi

# pythonz
if [ -s "${HOME}/.pythonz/etc/bashrc" ]; then
    source "${HOME}/.pythonz/etc/bashrc"
fi

# Set up virtualenvwrapper
if command -v virtualenvwrapper.sh > /dev/null 2>&1; then
    VENVWRAPPER=$(command -v virtualenvwrapper.sh)
fi

if [ "${VENVWRAPPER}" ]; then
    export VIRTUALENVWRAPPER_PYTHON=$(command -v python3)
    export WORKON_HOME="${HOME}/.virtualenvs"
    export PIP_VIRTUALENV_BASE="${WORKON_HOME}"
    source "${VENVWRAPPER}"
fi
