#!/bin/bash

hostname=$(hostname)

if [[ $hostname == *"pc"* ]]; then
    echo "This machine is identified as a Desktop PC."
    sudo nixos-rebuild switch --flake ~/nix/#pc
elif [[ $hostname == *"laptop"* ]]; then
    echo "This machine is identified as a Laptop."
    sudo nixos-rebuild switch --flake ~/nix/#laptop
else
    echo "Unable to determine the type of machine."
fi

