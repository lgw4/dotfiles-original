# ${HOME}/.bashrc.d/perl_config.sh

# perlbrew
export PERLBREW_ROOT="${HOME}/.perlbrew"

if [ -e ${HOME}/.perlbrew/etc/bashrc ]; then
        . ${HOME}/.perlbrew/etc/bashrc
fi

