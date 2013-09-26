# ${HOME}/.bashrc.d/python_config.sh

# Homebrew Python 2.7 package binaries
if [ -e /usr/local/share/python ]; then
    export PATH="/usr/local/share/python:${PATH}"
fi

# Homebrew Python 3.3 package binaries
if [ -e /usr/local/share/python3 ]; then
    export PATH="/usr/local/share/python3:${PATH}"
fi

# OS X local Python 2.7 package binaries
if [ -d ${HOME}/Library/Python/2.7/bin ]; then
    export PATH="${HOME}/Library/Python/2.7/bin:${PATH}"
fi

# OS X local Python 3.3 package binaries
if [ -d ${HOME}/Library/Python/3.3/bin ]; then
    export PATH="${HOME}/Library/Python/3.3/bin:${PATH}"
fi

# pythonz
if [ -s ${HOME}/.pythonz/etc/bashrc ]; then 
    source ${HOME}/.pythonz/etc/bashrc
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

