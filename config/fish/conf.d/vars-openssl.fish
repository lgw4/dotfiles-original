if test -d /usr/local/opt/openssl@1.1
    set -x CPPFLAGS -I/usr/local/opt/openssl@1.1/include $CPPFLAGS
    set -x LDFLAGS -L/usr/local/opt/openssl@1.1/lib $LDFLAGS
    set -x PKG_CONFIG_PATH /usr/local/opt/openssl@1.1/lib/pkgconfig $PKG_CONFIG_PATH
end
