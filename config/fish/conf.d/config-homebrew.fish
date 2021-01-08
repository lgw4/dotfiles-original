if test (uname) = "Darwin"
    if test -f /usr/local/bin/brew
        set -x HOMEBREW_ROOT /usr/local
    else if test -f /opt/homebrew/bin/brew
        set -x HOMEBREW_ROOT /opt/homebrew
    end
end
