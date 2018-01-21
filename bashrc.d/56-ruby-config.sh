# -*- mode: sh; -*-

# chruby
if command -v chruby > /dev/null 2>&1; then
    source "/usr/local/share/chruby/chruby.sh"
    source "/usr/local/share/chruby/auto.sh"
fi

