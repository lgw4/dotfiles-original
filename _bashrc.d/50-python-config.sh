# ${HOME}/.bashrc.d/python_config.sh

# pyenv
if `which pyenv > /dev/null`; then
    eval "$(pyenv init -)"
fi

# Set up virtualenvwrapper
VENVWRAPPER=`which virtualenvwrapper.sh`
if [ ${VENVWRAPPER} ]; then
    export VIRTUALENVWRAPPER_PYTHON=`which python2`
    export WORKON_HOME="${HOME}/.virtualenvs"
    export PIP_VIRTUALENV_BASE=${WORKON_HOME}
    if [ ${VENVWRAPPER} ]; then
        source ${VENVWRAPPER}
    fi
fi
