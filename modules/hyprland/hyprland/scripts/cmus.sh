#!/bin/sh

if screen -list | grep -q '\.cmus'; then
    alacritty -e screen -r cmus
else
    screen -dmS cmus cmus &
    alacritty -e screen -r cmus
fi

