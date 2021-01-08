if test (uname) = "Darwin"
    if test (arch) = "arm64"
        function brew -d "Intel Homebrew"
            /usr/bin/arch -x86_64 /usr/local/bin/brew $argv
        end
    end
end
