# Run fortune, if available
if command -v fortune > /dev/null 2>&1; then
    echo
    fortune
fi
