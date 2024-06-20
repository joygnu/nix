#!/bin/bash

# Get the current state of MOC
state=$(mocp -Q %state)

# Check the state and toggle accordingly
if [ "$state" == "PLAY" ]; then
    mocp -P
elif [ "$state" == "PAUSE" ]; then
    mocp -U
else
    echo "MOC is not currently playing or paused."
fi

