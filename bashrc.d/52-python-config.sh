# ${HOME}/.bashrc.d/python_config.sh

# macOS Python 2.7 packages
if [ -d "${HOME}/Library/Python/2.7/bin" ]; then
    export PATH="${HOME}/Library/Python/2.7/bin:${PATH}"
fi

# macOS Python 3 packages (be sure to create symlink)
if [ -d "${HOME}/Library/Python/3/bin" ]; then
    export PATH="${HOME}/Library/Python/3/bin:${PATH}"
fi

# pythonz
if [ -s "${HOME}/.pythonz/etc/bashrc" ]; then
    source "${HOME}/.pythonz/etc/bashrc"
fi

# pew
if command -v pew > /dev/null 2>&1; then
    source $(pew shell_config)
fi
