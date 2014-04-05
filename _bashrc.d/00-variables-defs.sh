# ${HOME}/.bashrc.d/00-variables-defs.sh

# Set architecture flags
export ARCHFLAGS="-arch x86_64"

# Use Homebrew curl-ca-bundle certificates
export SSL_CERT_FILE=/usr/local/opt/curl-ca-bundle/share/ca-bundle.crt

# Make subl editor, if available
if `which subl > /dev/null`; then
    export EDITOR="subl -n -w"
else
    export EDITOR="vim"
fi
