# ${HOME}/.bashrc.d/ruby-config.sh file.

# chruby
if command -v chruby > /dev/null 2>&1; then
    source /opt/local/share/chruby/chruby.sh
    source /opt/local/share/chruby/auto.sh
fi
