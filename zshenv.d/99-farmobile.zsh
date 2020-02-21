# Farmobile PostgreSQL configuration
if [[ -d "/usr/local/opt/postgresql@9.6/bin" ]]; then
    export PGUSER="cwarden"
fi

# Farmobile pip configuration
if [[ "${HOSTNAME}" == "constellation" ]]; then
    export PIP_EXTRA_INDEX_URL="https://pypi.farmobile.local/simple/"
    export PIP_TRUSTED_HOST="pypi.farmobile.local"
fi
