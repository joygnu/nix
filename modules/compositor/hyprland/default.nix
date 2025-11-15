{
  username,
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    hyprland.enable = lib.mkEnableOption "";
  };
  imports = [./scripts];
  config = lib.mkIf config.hyprland.enable {
    programs.hyprland = {
      enable = true;
    };
    home-manager.users.${username} = {
      wayland.windowManager.hyprland = {
        enable = true;
        settings = {
          "$mod" = "SUPER";

          cursor = {
            inactive_timeout = "3";
          };

          env = [
            "HYPRCURSOR_THEME = Bibata-Modern-Ice"
            "HYPRCURSOR_SIZE = 24"
            "NIXOS_OZONE_WL = 1"
          ];

          monitor = [
            "DP-1,highrr,auto,1"
            "eDP-1,prefrered,auto,1"
            "HDMI-A-1,prefrered,auto,1,mirror,eDP-1"
          ];

          exec-once = [
            "gsettings set org.gnome.desktop.interface cursor-theme Bibata-Modern-Ice"
            "ags"
            "${pkgs.networkmanagerapplet}/bin/nm-applet"
          ];

          windowrulev2 = [
            "float,title:(Disks)"
            "size 900 500,title:(Disks)"
            "float,title:(Calculator)"
            "size 400 700,title:(Calculator)"
            "float,title:(Bluetooth Devices)"
            "size 1200 700,title:(Bluetooth Devices)"
            "float,title:(Pipewire Volume Control)"
            "size 1200 700,title:(Pipewire Volume Control)"
            "float,title:(Clocks)"
            "size 900 600,title:(Clocks)"
            "opacity 0.9,class:(foot)"
          ];

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
            # start programs
            "$mod,TAB, exec, foot"
            "$mod, E, exec, foot -e yazi"
            "$mod, S, exec, firefox"
            "$mod, X, exec, keepassxc"
            "$mod, N, exec, foot -e newsboat"
            "$mod, A, exec, rofi -show drun"
            "$mod, M, exec, foot -e aerc"
            "$mod, C, exec, foot -e ikhal"
            "$mod, F, exec, ferdium --ozone-platform=wayland --enable-features=UseOzonePlatform,WebRTCPipeWireCapturer,WaylandWindowDecorations"
            "$mod, D, exec, [float; pin; size 80% 80%;] cmus-tmux"
            "$mod, O, exec, mpv-url"
            "$mod, V, exec, cliphist list | rofi show -dmenu | cliphist decode | wl-copy"
            "$mod, B, exec, ${pkgs.rofimoji}/bin/rofimoji -a copy"
            "$mod+shift, C, exec, ${pkgs.hyprpicker}/bin/hyprpicker -a"
            "$mod+Shift, Z, exec, ${pkgs.grim}/bin/grim - | ${pkgs.swappy}/bin/swappy -f -"
            ''$mod,T, exec,  ${pkgs.grim}/bin/grim -g "$(${pkgs.slurp}/bin/slurp)" - | ${pkgs.tesseract}/bin/tesseract - stdout -l deu --psm 6 | ${pkgs.wl-clipboard}/bin/wl-copy''
            ''$mod,Z, exec, ${pkgs.grim}/bin/grim -g "$(${pkgs.slurp}/bin/slurp)" - | ${pkgs.swappy}/bin/swappy -f -''

            # controls
            "$mod, Q, killactive"
            "$mod, W, togglefloating"
            "$mod, R, togglesplit"
            "$mod+shift, S, exec, systemctl suspend"
            "$mod+shift, M, exit, hyprland"
            "$mod+shift, L, exec, hyprlock"
            "$mod, G, exec, gamemode"
            "$mod+shift, B, exec, agsr"
            "$mod, P, exec, hyprctl dispatch togglefloating && hyprctl dispatch resizeactive exact 854 480 && hyprctl dispatch movewindow d && hyprctl dispatch movewindow r && hyprctl dispatch pin"
            "$mod, up, exec, vl -i"
            "$mod, down, exec, vl -d"
            "$mod, left, exec, vl -m"
            "$mod, right, exec, vl -t"

            # playerctl
            "$mod, space, exec, ${pkgs.playerctl}/bin/playerctl play-pause"
            "$mod, comma, exec, ${pkgs.playerctl}/bin/playerctl previous"
            "$mod, period, exec, ${pkgs.playerctl}/bin/playerctl next"
            "$mod, equal, exec, ${pkgs.playerctl}/bin/playerctl volume 0.1+"
            "$mod, minus, exec, ${pkgs.playerctl}/bin/playerctl volume 0.1-"

            # move focus
            "$mod, Return, fullscreen"
            "$mod, H, movefocus, l"
            "$mod, L, movefocus, r"
            "$mod, K, movefocus, u"
            "$mod, J, movefocus, d"

            # window resizing              X  Y
            "$mod+ctrl, H, resizeactive, -60 0"
            "$mod+ctrl, L, resizeactive,  60 0"
            "$mod+ctrl, K, resizeactive,  0 -60"
            "$mod+ctrl, J, resizeactive,  0  60"

            # moving windows
            "$mod SHIFT, H, movewindow, l"
            "$mod SHIFT, L, movewindow, r"
            "$mod SHIFT, K, movewindow, u"
            "$mod SHIFT, J, movewindow, d"

            # switch workspaces
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

            # move active window to a workspace
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
            ", XF86MonBrightnessUp, exec, ${pkgs.brightnessctl}/bin/brightnessctl  set +10%"
            ", XF86MonBrightnessDown, exec, ${pkgs.brightnessctl}/bin/brightnessctl set  10%-"
            ", XF86AudioRaiseVolume, exec, vl -i"
            ", XF86AudioLowerVolume, exec, vl -d"
            ", XF86AudioMute, exec, vl -m"
            ", XF86AudioMicMute, exec, vl -t"
          ];
        };
      };

      home.file.".config/swappy/config".text = ''
        [Default]
        save_dir=$HOME/media/pictures/screen
      '';
    };
    environment.systemPackages = with pkgs; [
      pwvucontrol
      sent
      imv
      gnome-clocks
      gnome-calculator
      gnome-disk-utility
      gnome-sound-recorder
    ];
  };
}
