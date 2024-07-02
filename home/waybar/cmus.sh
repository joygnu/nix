#!/bin/bash

# Fetch the status of cmus
status=$(cmus-remote -Q)

if [[ $? -ne 0 ]]; then
  echo "No song playing"
  exit 1
fi

# Extract artist, album, and title information
artist=$(echo "$status" | grep 'tag artist' | cut -d ' ' -f 3-)
title=$(echo "$status" | grep 'tag title' | cut -d ' ' -f 3-)

# Display the song information
if [ -n "$artist" ] && [ -n "$title" ]; then
  echo "$artist - $title"
else
  echo "No song playing"
fi

