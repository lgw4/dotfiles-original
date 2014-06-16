# ${HOME}/.bashrc.d/python_config.sh

# pyenv
function pyenv_init() {
    eval "$(pyenv init -)"
}

if `which pyenv > /dev/null`; then
    pyenv_init
elif [ `uname -s` == "Linux" ]; then
    PYENV_ROOT="${HOME}/.pyenv"
    if [ -d "${PYENV_ROOT}" ]; then
        export PATH="${PYENV_ROOT}/bin:${PATH}"
        pyenv_init
    fi
fi

# Set up virtualenvwrapper
VENVWRAPPER=`which virtualenvwrapper.sh`
if [ ${VENVWRAPPER} ]; then
    export VIRTUALENVWRAPPER_PYTHON=`which python2`
    export WORKON_HOME="${HOME}/.virtualenvs"
    export PIP_VIRTUALENV_BASE=${WORKON_HOME}
    source ${VENVWRAPPER}
fi
