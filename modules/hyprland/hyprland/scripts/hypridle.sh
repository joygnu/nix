#!/bin/sh

hostname=$(hostname)

if [ "$hostname" = "laptop" ]; then
    hypridle
fi
