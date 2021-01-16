if test (uname) = 'Darwin'
    and test (arch) = 'arm64'
    and test -e /usr/local/bin/brew
    function brew-arm64 -d "Apple Silicon Homebrew"
        set HOMEBREW_NO_ENV_FILTERING 1
        /opt/homebrew/bin/brew $argv
    end
end
