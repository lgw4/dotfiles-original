# ${HOME}/.bashrc.d/ruby_config.sh file.

# rbenv, rbenv-gemset, and ruby-build
if [ -e /usr/local/bin/rbenv ] || [ -e ${HOME}/.rbenv/bin/rbenv ]; then
        eval "$(rbenv init -)"
fi

