{
  username,
  nixpath,
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    hyprland.enable = lib.mkEnableOption "";
  };
  config = lib.mkIf config.hyprland.enable {
    programs.hyprland = {
      enable = true;
    };

    home-manager.users.${username} = {
      wayland.windowManager.hyprland = {
        enable = true;
        settings = {
          "$mod" = "SUPER";
          "$sciPath" = "${nixpath}/modules/wm/hyprland/scripts";
          cursor = {
            inactive_timeout = "3";
          };
          env = [
            "HYPRCURSOR_THEME = Bibata-Modern-Ice"
            "HYPRCURSOR_SIZE = 24"
            "NIXOS_OZONE_WL = 1"
          ];
          xwayland = {
            force_zero_scaling = true;
          };
          monitor = [
            "DP-1,highrr,auto,1,bitdepth,10"
            "eDP-1,prefrered,auto,1"
            "HDMI-A-1,prefrered,auto,1,mirror,eDP-1"
          ];
          exec-once = [
            "ags"
          ];
          windowrulev2 = [
            "float,title:(Disks)"
            "float,title:(Calculator)"
            "float,title:(Bluetooth)"
            "float,title:(Clocks)"
            "size 854 480,title:(Clocks)"
            "float,title:(Network Connections)"
            "float,title:(Pipewire)"
            "opacity 0.9,class:(foot)"
            "opacity 0.9,class:(dunst)"
          ];
          gestures = {
            workspace_swipe = true;
            workspace_swipe_forever = true;
            workspace_swipe_distance = 200;
          };
          general = {
            gaps_in = 5;
            gaps_out = 10;
            border_size = 4;
            allow_tearing = false;
            layout = "master";
          };
          misc = {
            disable_hyprland_logo = true;
            disable_splash_rendering = true;
            disable_hyprland_qtutils_check = true;
          };
          decoration = {
            rounding = 5;
          };
          input = {
            kb_layout = "us,de";
            kb_variant = ",qwerty";
            kb_options = "grp:alt_shift_toggle,caps:swapescape";
            repeat_rate = 50;
          };

          bind = [
            # launch Apps
            "$mod,TAB, exec, foot"
            "$mod, E, exec, foot -e yazi"
            "$mod, S, exec, firefox"
            "$mod, X, exec, keepassxc"
            "$mod, M, exec, mbsync -a && foot -e neomutt"
            "$mod, N, exec, foot -e newsboat"
            "$mod, A, exec, rofi -show drun"
            "$mod, C, exec, ${pkgs.hyprpicker}/bin/hyprpicker -a"
            "$mod+Shift, Z, exec, ${pkgs.grim}/bin/grim - | ${pkgs.swappy}/bin/swappy -f -"
            ''$mod,T, exec,  ${pkgs.grim}/bin/grim -g "$(${pkgs.slurp}/bin/slurp)" - | ${pkgs.tesseract}/bin/tesseract - stdout -l deu --psm 6 | wl-copy''
            ''$mod,Z, exec, ${pkgs.grim}/bin/grim -g "$(${pkgs.slurp}/bin/slurp)" - | ${pkgs.swappy}/bin/swappy -f -''
            "$mod, V, exec, cliphist list | rofi show -dmenu | cliphist decode | wl-copy"
            "$mod, O, exec, sh $sciPath/mpv.sh"
            "$mod, B, exec, ${pkgs.rofimoji}/bin/rofimoji"
            "$mod, F, exec, foot -e hx"
            # controls
            "$mod, Q, killactive"
            "$mod, W, togglefloating"
            "$mod, R, togglesplit"
            "$mod+shift, S, exec, systemctl suspend"
            "$mod+shift, M, exit, hyprland"
            "$mod, G, exec, sh $sciPath/gamemode.sh"
            "$mod+shift, B, exec, sh $sciPath/ags.sh"
            "$mod, up, exec, sh $sciPath/volume.sh -i"
            "$mod, down, exec, sh $sciPath/volume.sh -d"
            "$mod, P, exec, hyprctl dispatch togglefloating && hyprctl dispatch resizeactive exact 854 480 && hyprctl dispatch movewindow d && hyprctl dispatch movewindow r && hyprctl dispatch pin"
            # cmus
            "$mod, D, exec, [float; pin; size 80% 80%;] sh $sciPath/cmus.sh"
            "$mod, space, exec, ${pkgs.playerctl}/bin/playerctl play-pause"
            "$mod, comma, exec, ${pkgs.playerctl}/bin/playerctl previous"
            "$mod, period, exec, ${pkgs.playerctl}/bin/playerctl next"
            "$mod, equal, exec, cmus-remote -v +10%"
            "$mod, minus, exec, cmus-remote -v -10%"
            # Move focus
            "$mod, Return, fullscreen"
            "$mod, H, movefocus, l"
            "$mod, L, movefocus, r"
            "$mod, K, movefocus, u"
            "$mod, J, movefocus, d"
            # Window resizing              X  Y
            "$mod+ctrl, H, resizeactive, -60 0"
            "$mod+ctrl, L, resizeactive,  60 0"
            "$mod+ctrl, K, resizeactive,  0 -60"
            "$mod+ctrl, J, resizeactive,  0  60"
            # Moving windows
            "$mod SHIFT, H, movewindow, l"
            "$mod SHIFT, L, movewindow, r"
            "$mod SHIFT, K, movewindow, u"
            "$mod SHIFT, J, movewindow, d"
            # Switch workspaces
            "$mod, 1, workspace, 1"
            "$mod, 2, workspace, 2"
            "$mod, 3, workspace, 3"
            "$mod, 4, workspace, 4"
            "$mod, 5, workspace, 5"
            "$mod, 6, workspace, 6"
            "$mod, 7, workspace, 7"
            "$mod, 8, workspace, 8"
            "$mod, 9, workspace, 9"
            "$mod, 0, workspace, 10"
            # Move active window to a workspace
            "$mod+Shift, 1, movetoworkspace, 1"
            "$mod+Shift, 2, movetoworkspace, 2"
            "$mod+Shift, 3, movetoworkspace, 3"
            "$mod+Shift, 4, movetoworkspace, 4"
            "$mod+Shift, 5, movetoworkspace, 5"
            "$mod+Shift, 6, movetoworkspace, 6"
            "$mod+Shift, 7, movetoworkspace, 7"
            "$mod+Shift, 8, movetoworkspace, 8"
            "$mod+Shift, 9, movetoworkspace, 9"
            "$mod+Shift, 0, movetoworkspace, 10"
          ];
          bindm = [
            "$mod, mouse:272, movewindow"
            "$mod, mouse:273, resizewindow"
          ];
          bindl = [
            ", XF86MonBrightnessUp, exec, brightnessctl set +10%"
            ", XF86MonBrightnessDown, exec, brightnessctl set 10%-"
            ", XF86AudioRaiseVolume, exec, sh $sciPath/volume.sh -i"
            ", XF86AudioLowerVolume, exec, sh $sciPath/volume.sh -d"
            ", XF86AudioMute, exec, sh $sciPath/volume.sh -m"
            ", XF86AudioMicMute, exec, sh $sciPath/volume.sh -t"
          ];
        };
      };
      home.file.".config/swappy/config".text = ''
        [Default]
        save_dir=$HOME/media/pictures/screen
      '';
    };
  };
}
