{
  pkgs,
  nixpath,
  ...
}: let
  rebuild = pkgs.writeScriptBin "rb" ''
    current_dir=$(pwd)

    cd ${nixpath} || exit

    ${pkgs.alejandra}/bin/alejandra .

    git add .

    hostname=$(hostname)

    doas nixos-rebuild switch --flake ${nixpath}/#"$hostname"

    cd "$current_dir" || exit
  '';
in {
  environment.systemPackages = [rebuild];
}
