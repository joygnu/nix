{
  pkgs,
  nixpath,
  ...
}: let
  rebuild = pkgs.writeScriptBin "rb" ''
    current_dir=$(pwd)

    cd ${nixpath} || exit

    ${pkgs.alejandra}/bin/alejandra .

    git fetch

    current_branch=$(git rev-parse --abbrev-ref HEAD)

    if ! git diff --quiet HEAD..origin/"$current_branch"; then
      read -p "Do you want to pull the changes? (y/n): " pull_changes

      if [[ "$pull_changes" == "y" || "$pull_changes" == "Y" ]]; then
        git pull origin "$current_branch"
      fi
    fi

    git add .

    hostname=$(hostname)

    doas nixos-rebuild switch --flake ${nixpath}/#"$hostname"

    cd "$current_dir" || exit
  '';
in {
  environment.systemPackages = [rebuild];
}
