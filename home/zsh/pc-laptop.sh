#!/bin/bash

hostname=$(hostname)

if [[ $hostname == *"pc"* ]]; then
    sudo nixos-rebuild switch --flake ~/nix/#pc
elif [[ $hostname == *"laptop"* ]]; then
    sudo nixos-rebuild switch --flake ~/nix/#laptop
else
    echo "Unable to determine the type of machine."
fi

