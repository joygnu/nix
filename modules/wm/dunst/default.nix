{
  lib,
  config,
  username,
  pkgs,
  ...
}: {
  options = {
    dunst.enable = lib.mkEnableOption "";
  };
  config = lib.mkIf config.dunst.enable {
    home-manager.users.${username} = {
      services.dunst = {
        enable = true;
        settings = {
          global = {
            background = "#${config.home-manager.users.${username}.stylix.base16Scheme.base01}";
            foreground = "#${config.home-manager.users.${username}.stylix.base16Scheme.base05}";
            padding = 8;
            horizontal_padding = 8;
            separator_height = 2;
            frame_width = 4;
            corner_radius = 5;
            font = "${config.home-manager.users.${username}.stylix.fonts.monospace.name} 12";
            alignment = "center";
            vertical_alignment = "center";
            ellipsize = "middle";
            ignore_newline = false;
          };

          urgency_low = {
            frame_color = "#${config.home-manager.users.${username}.stylix.base16Scheme.base0B}";
          };

          urgency_normal = {
            frame_color = "#${config.home-manager.users.${username}.stylix.base16Scheme.base0D}";
          };

          urgency_critical = {
            frame_color = "#${config.home-manager.users.${username}.stylix.base16Scheme.base08}";
          };
        };
      };
      home.packages = with pkgs; [
        libnotify
      ];
    };
  };
}
