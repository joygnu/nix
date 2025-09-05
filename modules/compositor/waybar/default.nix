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
            modules-right = ["battery" "wireplumber" "custom/calendar" "clock" "tray" "custom/swaync"];

            "custom/waybar-mpris" = {
              return-type = "json";
              exec = ''${pkgs.waybar-mpris}/bin/waybar-mpris --autofocus --pause "⏸" '';
              on-click = "${pkgs.waybar-mpris}/bin/waybar-mpris --send toggle";
              on-click-right = "${pkgs.waybar-mpris}/bin/waybar-mpris --send player-next";
              escape = true;
            };

            "custom/calendar" = {
              exec = ''date +" %m %d "'';
              on-click = "foot -e ikhal";
            };

            "custom/swaync" = {
              tooltip = false;
              format = " {icon} ";
              format-icons = {
                notification = "<span foreground='red'><sup></sup></span>";
                none = " ";
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

            "wireplumber" = {
              on-click = "pwvucontrol";
            };
            "tray" = {
              icon-size = 20;
              spacing = 10;
            };
          };
        };
        style = ''
          tray {
            padding: 0 20px;
          }

        '';
        #workspaces button {
        # padding: 0 20px;
        # }
        #     #custom-waybar-mpris {
        #       padding: 0 20 px;
        #     }

        #     #battery {
        #       padding: 0 20px;
        #     }

        #     #wireplumber {
        #       padding: 0 20 px;
        #     }
        #     #custom-calendar {
        #       padding: 0 20 px;
        #     }

        #     #clock {
        #       padding: 0 20px;
        #     }

        #     #custom-swaync {
        #       padding: 0 20px;
        #     }
      };
    };
  };
}
