#!/bin/sh

# Get the URL from the clipboard
link=$(wl-paste)

# Check if the link is not empty
if [ -n "$link" ]; then
    # Notify the user that the link is about to be opened
    notify-send "Opening Link" "$link"

    # Try to open the link with mpv and capture any errors
    error_message=$(mpv "$link" 2>&1)

    if [ $? -ne 0 ]; then
        # If mpv fails, notify the user with the error message
        notify-send "Error" "Failed to open the link with mpv:\n$error_message"
    fi
else
    notify-send "Error" "No URL provided."
fi
i
