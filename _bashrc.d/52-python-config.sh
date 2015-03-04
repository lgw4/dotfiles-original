# ${HOME}/.bashrc.d/python_config.sh

# pythonz
if [ -s "${HOME}/.pythonz/etc/bashrc" ]; then
    source "${HOME}/.pythonz/etc/bashrc"
fi

# Set up virtualenvwrapper
VENVWRAPPER=`command -v virtualenvwrapper.sh`
if [ "${VENVWRAPPER}" ]; then
    export VIRTUALENVWRAPPER_PYTHON=`command -v python2`
    export WORKON_HOME="${HOME}/.virtualenvs"
    export PIP_VIRTUALENV_BASE="${WORKON_HOME}"
    source "${VENVWRAPPER}"
fi
