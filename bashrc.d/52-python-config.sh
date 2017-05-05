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
[[ -s ${HOME}/.pythonz/etc/bashrc ]] && source ${HOME}/.pythonz/etc/bashrc

if command -v virtualenvwrapper.sh > /dev/null 2>&1; then
    export VIRTUALENVWRAPPER_PYTHON="$(command -v python3)"
    source "$(command -v virtualenvwrapper.sh)"
fi
