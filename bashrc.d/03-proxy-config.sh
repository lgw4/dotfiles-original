# 03-proxy-config.sh

if command -v networksetup > /dev/null 2>&1; then
    if [[ `networksetup -getcurrentlocation` == "DST" ]]; then
        export http_proxy="10.224.2.11:9119"
        export https_proxy="10.224.2.11:9119"
    fi
fi