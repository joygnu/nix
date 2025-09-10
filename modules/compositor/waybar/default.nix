{
  username,
  pkgs,
  lib,
  config,
  ...
}: {
  config = lib.mkIf config.hyprland.enable {
    home-manager.users.${username} = {
      wayland.windowManager.hyprland.settings.exec-once = ["waybar"];

      programs.waybar = {
        enable = true;
        settings = {
          mainBar = {
            layer = "top";
            position = "top";
            height = 36;
            modules-left = ["hyprland/workspaces"];
            modules-center = ["custom/waybar-mpris"];
            modules-right = ["battery" "wireplumber" "clock#calendar" "clock" "tray" "custom/swaync"];

            "custom/waybar-mpris" = {
              return-type = "json";
              exec = ''${pkgs.waybar-mpris}/bin/waybar-mpris --autofocus --pause "⏸" '';
              on-click = "${pkgs.waybar-mpris}/bin/waybar-mpris --send toggle";
              on-click-right = "${pkgs.waybar-mpris}/bin/waybar-mpris --send player-next";
              escape = true;
            };

            "custom/swaync" = {
              tooltip = false;
              format = " {icon} ";
              format-icons = {
                notification = "<span foreground='red'><sup></sup></span>";
                none = "";
                dnd-notification = "<span foreground='red'><sup></sup></span>";
                dnd-none = "";
                inhibited-notification = "<span foreground='red'><sup></sup></span>";
                inhibited-none = "";
                dnd-inhibited-notification = "<span foreground='red'><sup></sup></span>";
                dnd-inhibited-none = "";
              };
              return-type = "json";
              exec-if = "which swaync-client";
              exec = "swaync-client -swb";
              on-click = "swaync-client -t -sw";
              on-click-right = "swaync-client -d -sw";
              escape = true;
            };

            "clock" = {
              on-click = "gnome-clocks ";
            };

            "clock#calendar" = {
              on-click = "foot -e ikhal";
              format = "{:%m %d}";
              interval = 60;
            };

            "wireplumber" = {
              on-click = "pwvucontrol";
            };
            "tray" = {
              icon-size = 20;
              spacing = 10;
            };
          };
        };
      };
    };
  };
}
