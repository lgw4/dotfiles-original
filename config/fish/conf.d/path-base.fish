for dir_ in /usr/local/sbin /usr/local/bin
    if not contains $dir_ $PATH
        set -x PATH $dir_ $PATH
    end
end

if test -d /opt/homebrew
    for dir_ in /opt/homebrew/sbin /opt/homebrew/bin
        if not contains $dir_ $PATH
            set -x PATH $dir_ $PATH
        end
    end
end

if test -e /etc/debian_version
    for dir_ in /usr/sbin /sbin
        if not contains $dir_ $PATH
            set -x PATH $dir_ $PATH
        end
    end
end
