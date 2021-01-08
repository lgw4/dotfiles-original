if test -d $HOMEBREW_ROOT/opt/openssl@1.1
    set -x CPPFLAGS -I$HOMEBREW_ROOT/opt/openssl@1.1/include $CPPFLAGS
    set -x LDFLAGS -L$HOMEBREW_ROOT/opt/openssl@1.1/lib $LDFLAGS
    set -x PKG_CONFIG_PATH $HOMEBREW_ROOT/opt/openssl@1.1/lib/pkgconfig $PKG_CONFIG_PATH
end
