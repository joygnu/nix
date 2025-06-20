{
  lib,
  pkgs,
  config,
  username,
  ...
}: {
  options = {
    steam.enable = lib.mkEnableOption "";
  };
  config = lib.mkIf config.steam.enable {
    programs.steam = {
      enable = true;
      extest.enable = true;
      remotePlay.openFirewall = true;
    };
    home-manager.users.${username}.wayland.windowManager.hyprland.settings = {exec-once = ["steam -silent &"];};
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
