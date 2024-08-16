{ pkgs, lib, ... }:
{
  environment.systemPackages = with pkgs; [
    teams
  ];
  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "teams"
  ];

}

