{
  lib,
  config,
  username,
  pkgs,
  ...
}: {
  config = lib.mkIf config.hyprland.enable {
    home-manager.users.${username} = {
      services.swaync = {
        enable = true;
      };
      home.packages = with pkgs; [
        libnotify
      ];
    };
  };
}
