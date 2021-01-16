if test (uname) = 'Darwin'
    and test (arch) = 'arm64'
    function pipx-x86_64 -d "Rosetta2 pipx"
        /usr/bin/arch -x86_64 pipx $argv
    end
end
