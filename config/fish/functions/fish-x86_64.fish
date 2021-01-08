if test (uname) = "Darwin"
    if test (arch) = "arm64"
        function fish-x86_64 -d "Intel Fish shell"
            /usr/bin/arch -x86_64 /usr/local/bin/fish
        end
    end
end
