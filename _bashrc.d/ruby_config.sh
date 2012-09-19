# ${HOME}/.bashrc.d/ruby_config.sh file.

# rbenv, rbenv-gemset, and ruby-build
if [ -e /usr/local/bin/rbenv ]; then
    eval "$(rbenv init -)"
elif [ -e ${HOME}/.rbenv/bin/rbenv ]; then
    export PATH="${HOME}/.rbenv/bin:${PATH}"
    eval "$(rbenv init -)"
fi

