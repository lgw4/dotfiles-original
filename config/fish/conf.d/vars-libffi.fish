if test -d $HOMEBREW_ROOT/opt/libffi
    set -x CPPFLAGS -I$HOMEBREW_ROOT/opt/libffi/include $CPPFLAGS
    set -x LDFLAGS -L$HOMEBREW_ROOT/opt/libffi/lib $LDFLAGS
    set -x PKG_CONFIG_PATH $HOMEBREW_ROOT/opt/libffi/lib/pkgconfig $PKG_CONFIG_PATH
end
