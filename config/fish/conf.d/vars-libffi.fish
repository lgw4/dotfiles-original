if test -d /usr/local/opt/libffi
    set -x CPPFLAGS -I/usr/local/opt/libffi/include $CPPFLAGS
    set -x LDFLAGS -L/usr/local/opt/libffi/lib $LDFLAGS
    set -x PKG_CONFIG_PATH /usr/local/opt/libffi/lib/pkgconfig $PKG_CONFIG_PATH
end
