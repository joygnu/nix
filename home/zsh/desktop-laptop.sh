#!/bin/sh

hostname=$(hostname)

if [[ $hostname == *"desktop"* ]]; then
    sudo nixos-rebuild switch --flake ~/nix/#desktop
elif [[ $hostname == *"laptop"* ]]; then
    sudo nixos-rebuild switch --flake ~/nix/#laptop
else
    echo "Unable to determine the type of machine."
fi

