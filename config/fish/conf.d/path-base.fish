path_prepend /usr/local/sbin
path_prepend /usr/local/bin

if test (uname) = 'Darwin'
    if test (/usr/bin/arch) = 'arm64'
        and not test -f /usr/local/bin/brew
        set -x HOMEBREW_ROOT /opt/homebrew
    else
        set -x HOMEBREW_ROOT /usr/local
    end

    if test $HOMEBREW_ROOT = '/usr/local'
        path_append /opt/homebrew/bin
        path_append /opt/homebrew/sbin
    else
        path_prepend /opt/homebrew/sbin
        path_prepend /opt/homebrew/bin
    end
end

if test (uname) = 'Linux'
    if test -e /etc/debian_version
        path_prepend /sbin
        path_prepend /usr/sbin
    end
end
