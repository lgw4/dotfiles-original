# ${HOME}/.bashrc.d/python_config.sh

# pythonbrew
if [ -s "${HOME}/.pythonbrew/etc/bashrc" ]; then
    source "${HOME}/.pythonbrew/etc/bashrc"
fi

# Set up virtualenvwrapper
if [ -e ${HOME}/.local/bin/virtualenvwrapper.sh ]; then
    export VIRTUALENVWRAPPER_PYTHON=`which python`
    export WORKON_HOME="${HOME}/.virtualenvs"
    export PIP_VIRTUALENV_BASE=${WORKON_HOME}
    source ${HOME}/.local/bin/virtualenvwrapper.sh
fi

