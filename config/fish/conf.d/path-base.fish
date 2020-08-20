for dir_ in /usr/local/sbin /usr/local/bin
    if not contains $dir_ $PATH
        set -x PATH $dir_ $PATH
    end
end

if test -e /etc/debian_version
    for dir_ in /usr/sbin /sbin
        if not contains $dir_ $PATH
            set -x PATH $dir_ $PATH
        end
    end
end
