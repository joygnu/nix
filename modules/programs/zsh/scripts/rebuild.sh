#!/bin/sh

current_dir=$(pwd)

cd ~/nix || exit

alejandra .

git fetch

if git diff --quiet HEAD..origin/main; then
    echo "No changes detected in the remote. Proceeding with rebuild..."

    git add .

    hostname=$(hostname)

    doas nixos-rebuild switch --flake ~/nix/#"$hostname"

else
    echo "Changes detected in the remote. Stopping execution."
    git diff HEAD..origin/main
    exit 1
fi

cd "$current_dir" || exit
