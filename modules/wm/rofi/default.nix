{
  lib,
  config,
  username,
  pkgs,
  nixpath,
  ...
}: {
  options = {
    rofi.enable = lib.mkEnableOption "";
  };
  config = lib.mkIf config.rofi.enable {
    home-manager.users.${username} = {
      programs.rofi = {
        enable = true;
        package = pkgs.rofi-wayland;
        theme = "${nixpath}/modules/wm/rofi/gruvbox-material.rasi";
        extraConfig = {
          display-drun = "";
          show-icons = true;
          terminal = "foot";
        };
      };
    };
  };
}
