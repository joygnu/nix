#!/bin/sh

hostname=$(hostname)

git add .

if [[ $hostname == *"desktop"* ]]; then
    sudo nixos-rebuild switch --flake ~/nix/#desktop 
elif [[ $hostname == *"laptop"* ]]; then
    sudo nixos-rebuild switch --flake ~/nix/#laptop 
fi
