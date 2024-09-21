{
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
    services.joycond.enable = true;
}
