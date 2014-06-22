# ${HOME}/.bashrc.d/ruby-config.sh file.

# chruby
if [ -d "/usr/local/share/chruby" ]; then
    source /usr/local/share/chruby/chruby.sh
    source /usr/local/share/chruby/auto.sh
fi
