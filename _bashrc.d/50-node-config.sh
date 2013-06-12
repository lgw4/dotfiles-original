# ${HOME}/.bashrc.d/50-node-config.sh

# NPM executables
if [ -e /usr/local/share/npm/bin ] ; then
    export PATH="/usr/local/share/npm/bin:${PATH}"
fi

# NVM support 
if [ -e ${HOME}/.nvm/nvm.sh ]; then
    source ${HOME}/.nvm/nvm.sh 
fi

