if [ -f /etc/profile ]; then
	source /etc/profile
fi

if [[ -f "$HOME"/.bashrc ]]; then
   source "$HOME"/.bashrc
fi

# Tell me my fortune…
if command -v fortune > /dev/null 2>&1; then
    echo
    fortune
fi
