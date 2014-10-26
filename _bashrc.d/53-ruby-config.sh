# ${HOME}/.bashrc.d/ruby-config.sh file.

# chruby
if hash chruby 2>/dev/null; then
    source /usr/local/share/chruby/chruby.sh
    source /usr/local/share/chruby/auto.sh
fi
