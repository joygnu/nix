#!/bin/sh

# Get the link from the clipboard using wl-paste
link=$(wl-paste)

# Check if a link was provided
if [ -n "$link" ]; then
    # Open the link in mpv
    mpv "$link"
else
    echo "No URL provided."
fi
