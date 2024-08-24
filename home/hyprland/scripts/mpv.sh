#!/bin/sh

# Run rofi to ask for the link
link=$(rofi -dmenu -p )

# Check if a link was provided
if [ -n "$link" ]; then
    # Open the link in mpv
    mpv "$link"
else
    echo "No URL provided."
fi
