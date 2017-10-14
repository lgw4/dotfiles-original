# ${HOME}/.bashrc.d/56-python_config.sh

# macOS current Python packages (be sure to create symlink)
if [ -d "${HOME}/Library/Python/Current/bin" ]; then
    export PATH="${PATH}:${HOME}/Library/Python/Current/bin"
fi

# macOS legacy Python packages (be sure to create symlink)
if [ -d "${HOME}/Library/Python/Legacy/bin" ]; then
    export PATH="${PATH}:${HOME}/Library/Python/Legacy/bin"
fi

# pythonz
[[ -s ${HOME}/.pythonz/etc/bashrc ]] && source ${HOME}/.pythonz/etc/bashrc

# Enable pew
if command -v pew > /dev/null 2>&1; then
    export WORKON_HOME="${HOME}/.local/virtualenvs"
    export PROJECT_HOME="${HOME}/Developer/python"
    source "$(pew shell_config)"
fi