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


# Set up pew

if command -v pew > /dev/null 2>&1; then
    source $(pew shell_config)
fi

# Set up virtualenvwrapper
#if command -v virtualenvwrapper.sh > /dev/null 2>&1; then
#    VENVWRAPPER="$(command -v virtualenvwrapper.sh)"
#fi

#if [ "${VENVWRAPPER}" ]; then
#    export VIRTUALENVWRAPPER_PYTHON="$(command -v python3)"
#    export WORKON_HOME="${HOME}/.virtualenvs"
#    export PIP_VIRTUALENV_BASE="${WORKON_HOME}"
#    source "${VENVWRAPPER}"
#fi
