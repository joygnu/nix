#!/bin/sh

current_dir=$(pwd)

cd ~/nix

git add .

hostname=$(hostname)

if echo "$hostname" | grep -q 'desktop'; then
    sudo nixos-rebuild switch --flake ~/nix/#desktop 
elif echo "$hostname" | grep -q 'laptop'; then
    sudo nixos-rebuild switch --flake ~/nix/#laptop 
elif echo "$hostname" | grep -q 'localhost'; then
    nix-on-droid switch --flake ~/nix
fi

cd "$current_dir"
