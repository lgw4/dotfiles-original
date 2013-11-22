# ${HOME}/.bashrc.d/python_config.sh

# pythonz
if [ -s ${HOME}/.pythonz/etc/bashrc ]; then 
    source ${HOME}/.pythonz/etc/bashrc
fi

# Set up virtualenvwrapper
VENVWRAPPER=$(which virtualenvwrapper.sh)
if [ ${VENVWRAPPER} ]; then
    export VIRTUALENVWRAPPER_PYTHON=`which python2.7`
    export WORKON_HOME="${HOME}/.virtualenvs"
    export PIP_VIRTUALENV_BASE=${WORKON_HOME}
    if [ ${VENVWRAPPER} ]; then
        source ${VENVWRAPPER}
    fi
fi

