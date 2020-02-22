if [[ -d "/usr/local/opt/openssl@1.1/" ]]; then
    cppflags+=("-I/usr/local/opt/openssl@1.1/include")
    ldflags+=("-L/usr/local/opt/openssl@1.1/lib")
    pkg_config_path+=("/usr/local/opt/openssl@1.1/lib/pkgconfig")
    export CPPFLAGS
    export LDFLAGS
    export PKG_CONFIG_PATH
fi
