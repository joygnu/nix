{
  lib,
  config,
  username,
  pkgs,
  ...
}: {
  config = lib.mkIf config.hyprland.enable {
    home-manager.users.${username} = {
      home.packages = with pkgs; [
        wl-clipboard
      ];

      services.cliphist.enable = true;
    };
  };
}
