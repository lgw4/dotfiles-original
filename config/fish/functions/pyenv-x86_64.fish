if test (uname) = 'Darwin'
    and test (arch) = 'arm64'
    function pyenv-x86_64 -d "Rosetta2 pyenv"
        /usr/bin/arch -x86_64 pyenv $argv
    end
end
