# ${HOME}/.bashrc.d/ruby-config.sh file.

# Homebrew Ruby
if [ -e /usr/local/opt/ruby/bin ]; then
    export PATH="/usr/local/opt/ruby/bin:${PATH}"
fi

# If rbenv, rbenv-gemset, and/or ruby-build are installed, inform PATH
if `which rbenv > /dev/null`; then 
    eval "`rbenv init -`"
fi

