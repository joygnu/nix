#!/bin/sh

link=$(wl-paste)

if [ -n "$link" ]; then
    mpv "$link" &

    notify-send "Opening Link" "$link" --icon=video-x-generic
else
    notify-send "Error" "No URL provided." --icon=dialog-error
fi
