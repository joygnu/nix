{
  lib,
  pkgs,
  config,
  ...
}: {
  options = {
    steam.enable = lib.mkEnableOption "";
  };
  config = lib.mkIf config.steam.enable {
    programs.steam.enable = true;
    nixpkgs.config.allowUnfreePredicate = pkg:
      builtins.elem (lib.getName pkg) [
        "steam-original"
        "steam"
        "steam-run"
        "steam-unwrapped"
      ];
    environment.systemPackages = with pkgs; [
      mangohud
      lutris-free
      prismlauncher
    ];
  };
}
