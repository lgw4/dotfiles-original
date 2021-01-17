if test (uname) = 'Darwin'
    and test (arch) = 'arm64'
    and test -e /opt/homebrew/bin/direnv
    function direnv -d "Apple Silicon direnv"
        /opt/homebrew/bin/direnv $argv
    end
end
