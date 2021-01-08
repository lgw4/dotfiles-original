if test (uname) = "Darwin"
    if test (arch) = "arm64"
        function brew-arm64 -d "Apple Silicon Homebrew"
            HOMEBREW_NO_ENV_FILTERING=1 /opt/homebrew/bin/brew $argv
        end
    end
end