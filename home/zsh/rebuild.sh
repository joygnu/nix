#!/bin/sh

hostname=$(hostname)

if [[ $hostname == *"desktop"* ]]; then
    sudo nixos-rebuild switch --flake ~/nix/#desktop &>nixos-switch.log || (cat nixos-switch.log | grep --color error && false)
elif [[ $hostname == *"laptop"* ]]; then
    sudo nixos-rebuild switch --flake ~/nix/#laptop &>nixos-switch.log || (cat nixos-switch.log | grep --color error && false)
fi
