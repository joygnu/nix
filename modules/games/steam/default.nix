{
  lib,
  pkgs,
  config,
  ...
}: {
  options = {
    games.enable = lib.mkEnableOption "";
  };
  config = lib.mkIf config.games.enable {
    # programs.steam.enable = true;
    nixpkgs.config.allowUnfreePredicate = pkg:
      builtins.elem (lib.getName pkg) [
        "steam-original"
        "steam"
        "steam-run"
        "steam-unwrapped-1.0.0.81"
      ];
    environment.systemPackages = with pkgs; [
      mangohud
      lutris-free
    ];
  };
}
