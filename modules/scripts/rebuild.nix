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

    if git diff --quiet HEAD..origin/main; then
      echo "No changes detected in the remote. Proceeding with rebuild..."

      git add .

      hostname=$(hostname)

      doas nixos-rebuild switch --flake ${nixpath}/#"$hostname"

    else
      echo "Changes detected in the remote. Stopping execution."
      git diff HEAD..origin/main
      exit 1
    fi

    cd "$current_dir" || exit
  '';
in {
  environment.systemPackages = [rebuild];
}
