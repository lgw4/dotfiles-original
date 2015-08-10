# ${HOME}/.bashrc.d/50-vagrant-config.sh file

if [ -e "/opt/vagrant/bin/vagrant" ] ; then
    export PATH="${PATH}:/opt/vagrant/bin"
fi
