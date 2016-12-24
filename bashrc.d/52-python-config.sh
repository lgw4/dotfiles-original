# ${HOME}/.bashrc.d/python_config.sh

# macOS legacy Python packages (be sure to create symlink)
if [ -d "${HOME}/Library/Python/Legacy/bin" ]; then
    export PATH="${HOME}/Library/Python/Legacy/bin:${PATH}"
fi

# macOS current Python packages (be sure to create symlink)
if [ -d "${HOME}/Library/Python/Current/bin" ]; then
    export PATH="${HOME}/Library/Python/Current/bin:${PATH}"
fi

# pythonz
if [ -s "${HOME}/.pythonz/etc/bashrc" ]; then
    source "${HOME}/.pythonz/etc/bashrc"
fi

# pew
if command -v pew > /dev/null 2>&1; then
    source $(pew shell_config)
fi
