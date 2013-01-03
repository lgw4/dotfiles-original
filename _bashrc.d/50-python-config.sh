# ${HOME}/.bashrc.d/python_config.sh

# pythonbrew
if [ -s "${HOME}/.pythonbrew/etc/bashrc" ]; then
    source "${HOME}/.pythonbrew/etc/bashrc"
fi

# If on OS X and Homebrew is installed, add PyPI binaries to PATH
if [ -e /usr/local/bin/brew ]; then
    PATH="/usr/local/share/python:${PATH}"
fi

# Check for OS X local Python binaries
if [ -d ${HOME}/Library/Python/2.7/bin ]; then
    PATH="${HOME}/Library/Python/2.7/bin:${PATH}"
fi

# Set up virtualenvwrapper
VENVWRAPPER=`which virtualenvwrapper.sh 2> /dev/null`
if [ ${VENVWRAPPER} ]; then
    export VIRTUALENVWRAPPER_PYTHON=`which python2.7`
    export WORKON_HOME="${HOME}/.virtualenvs"
    export PIP_VIRTUALENV_BASE=${WORKON_HOME}
    if [ ${VENVWRAPPER} ]; then
        source ${VENVWRAPPER}
    fi
fi

