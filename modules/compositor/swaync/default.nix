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
        settings = {
          notification-2fa-action = false;
          widgets = [
            "title"
            "buttons-grid"
            "dnd"
            "notifications"
            "mpris"
            "volume"
          ];
        };
      };

      home.packages = with pkgs; [
        libnotify
      ];
    };
  };
}
