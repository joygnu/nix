{
  lib,
  pkgs,
  config,
  ...
}: {
  options = {
    steam.enable = lib.mkEnableOption "";
  };
  config = lib.mkIf config.norisk.enable {
    programs.steam.enable = true;
    nixpkgs.config.allowUnfreePredicate = pkg:
      builtins.elem (lib.getName pkg) [
        "steam-original"
        "steam"
        "steam-run"
      ];
    environment.systemPackages = with pkgs; [
      mangohud
      lutris-free
    ];
  };
}
