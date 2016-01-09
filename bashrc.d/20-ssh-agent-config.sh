# ssh-agent-config.sh

if [ `uname` == "Darwin" ]; then
    eval "$(ssh-agent)" > /dev/null

    function cleanup {
        kill -9 "${SSH_AGENT_PID}"
    }

    trap cleanup EXIT
fi
