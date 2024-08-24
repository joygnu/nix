{
  pkgs,
  lib,
  ...
}: {
  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (lib.getName pkg) [
      "steam-original"
      "steam"
      "steam-run"
    ];
  programs.steam.enable = true;
  environment.systemPackages = with pkgs; [
    prismlauncher
    dolphin-emu
    zulu17
    mangohud
    lutris
  ];
}
