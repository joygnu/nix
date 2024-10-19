#!/bin/sh

current_dir=$(pwd)

cd ~/nix || exit

alejandra .

git fetch

if git diff --quiet HEAD..origin/main; then
    echo "No changes detected in the remote. Proceeding with rebuild..."

    git add .

    hostname=$(hostname)

    if echo "$hostname" | grep -q 'desktop'; then
        doas nixos-rebuild switch --flake ~/nix/#desktop
    elif echo "$hostname" | grep -q 'laptop'; then
        doas nixos-rebuild switch --flake ~/nix/#laptop
    elif echo "$hostname" | grep -q 'server'; then
        doas nixos-rebuild switch --flake ~/nix/#server
    elif echo "$hostname" | grep -q 'localhost'; then
        nix-on-droid switch --flake ~/nix
    fi
else
    echo "Changes detected in the remote. Stopping execution."
    git diff HEAD..origin/main
    exit 1
fi

cd "$current_dir" || exit
