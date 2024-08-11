{ pkgs, lib, ... }:
{
  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "steam"
  ];
  programs.steam.enable = true;
  environment.systemPackages = with pkgs; [
    prismlauncher
    mangohud
    lutris
    zulu17
  ];
}
