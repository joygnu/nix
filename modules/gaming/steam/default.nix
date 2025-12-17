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
      protontricks.enable = true;
      extraPackages = with pkgs; [
        mangohud
      ];
    };
    home-manager.users.${username}.wayland.windowManager.hyprland.settings = {exec-once = ["steam -silent &"];};
  };
}
