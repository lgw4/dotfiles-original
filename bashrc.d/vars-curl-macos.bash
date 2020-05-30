# shellcheck shell=bash
if [[ ${OS_KERNEL} == "Darwin" ]]; then
    export CURL_SSL_BACKEND=secure-transport
fi
