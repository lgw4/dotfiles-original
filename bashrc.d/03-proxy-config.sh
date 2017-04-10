# 03-proxy-config.sh

if command -v networksetup > /dev/null 2>&1; then
    if [[ `networksetup -getcurrentlocation` == "DST" ]]; then
        export http_proxy="dstproxy.dstcorp.net:9119"
        export https_proxy="dstproxy.dstcorp.net:9119"
    fi
fi
