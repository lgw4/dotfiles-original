# ${HOME}/.bashrc.d/ruby-config.sh file.

# If rbenv, rbenv-gemset, and/or ruby-build are installed, inform PATH
RBENV="`which rbenv 2> /dev/null`"
if [ ${RBENV} ]; then
    eval "$(rbenv init -)"
elif [ -e ${HOME}/.rbenv/bin/rbenv ]; then
    PATH="${HOME}/.rbenv/bin:${PATH}"
    eval "$(rbenv init -)"
fi

