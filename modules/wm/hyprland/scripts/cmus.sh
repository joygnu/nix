#!/bin/sh

if tmux has-session -t cmus 2>/dev/null; then
    alacritty -e tmux attach-session -t cmus
else
    tmux new-session -d -s cmus cmus
    alacritty -e tmux attach-session -t cmus
fi
