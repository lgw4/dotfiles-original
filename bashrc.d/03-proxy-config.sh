# 03-proxy-config.sh

if command -v networksetup > /dev/null 2>&1; then
    if [[ `networksetup -getcurrentlocation` == "DST" ]]; then
        export http_proxy="dstproxy.dstcorp.net:9119"
        export https_proxy="${http_proxy}"
        export no_proxy="*.local, 169.254.0.0/16, 172.30.0.0/16, *.ad.dstsystems.com, *.dstcorp.net"
        export HTTP_PROXY="${http_proxy}"
        export HTTPS_PROXY="${https_proxy}"
        export NO_PROXY="${no_proxy}"
    fi
fi
