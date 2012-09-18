# ${HOME}/.bashrc.d/ruby_config.sh file.

# rbenv, rbenv-gemset, and ruby-build
RBENV_PATH=`which rbenv`
if [ -e ${RBENV_PATH} ]; then
        eval "$(rbenv init -)"
fi

