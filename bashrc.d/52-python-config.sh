# ${HOME}/.bashrc.d/python_config.sh

# Python 2.7 packages
if [ -d "${HOME}/Library/Python/2.7/bin" ]; then
    export PATH="${HOME}/Library/Python/2.7/bin:${PATH}"
fi

# Python 3.5 packages
if [ -d "${HOME}/Library/Python/3.5/bin" ]; then
    export PATH="${HOME}/Library/Python/3.5/bin:${PATH}"
fi

# pythonz
if [ -s "${HOME}/.pythonz/etc/bashrc" ]; then
    source "${HOME}/.pythonz/etc/bashrc"
fi
