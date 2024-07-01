#!/usr/bin/env bash

# Start cmus in a screen session named 'cmus_session'
screen -S cmus_session -dm cmus

echo "cmus started in screen session 'cmus_session'. Use 'screen -r cmus_session' to attach."

