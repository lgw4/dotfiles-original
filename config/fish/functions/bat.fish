if test (uname) = 'Darwin'
    and test (arch) = 'arm64'
    and test -e /opt/homebrew/bin/bat
    function bat -d "Apple Silicon bat"
        /opt/homebrew/bin/bat $argv
    end
end
