#!/bin/sh

# Check if a tmux session named 'cmus' exists
if tmux has-session -t cmus 2>/dev/null; then
    # Attach to the existing tmux session
    alacritty -e tmux attach-session -t cmus
else
    # Create a new tmux session named 'cmus' and run cmus
    tmux new-session -d -s cmus cmus
    alacritty -e tmux attach-session -t cmus
fi
