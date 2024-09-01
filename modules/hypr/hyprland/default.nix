{pkgs, ...}: {
  programs.hyprland.enable = true;
  home-manager.users.joy.home.packages = with pkgs; [
    rofi-wayland
    pwvucontrol
    swww
    wl-clipboard
    cliphist
    grim
    slurp
    hyprpicker
    swappy
    # hypridle
    playerctl
  ];

  home-manager.users.joy.services.cliphist.enable = true;

  home-manager.users.joy.wayland.windowManager.hyprland = {
    enable = true;

    settings = {
      "$mod" = "SUPER";
      "$sciPath" = "~/nix/modules/hyprland/hyprland/scripts";

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
        "DP-1,2560x1440@165.00Hz,auto,1,bitdepth,10"
        "eDP-1,prefrered,auto,1"
        "HDMI-A-1,prefrered,auto,1,mirror,eDP-1"
      ];

      exec-once = [
        "ags"
        # "sh $sciPath/hypridle.sh"
      ];

      windowrule = [
        "float,title:^(Pipewire)(.*)$"
        "float,title:^(Disks)(.*)$"
        "float,title:^(Calculator)(.*)$"
        "float,title:^(Bluetooth)(.*)$"
        "float,title:^(Clocks)(.*)$"
        "float,title:^(Network Connections)(.*)$"
        "opacity 0.9,^(Alacritty)(.*)$"
      ];

      gestures = {
        workspace_swipe = true;
        workspace_swipe_forever = true;
        workspace_swipe_distance = 200;
      };

      bind = [
        # launch Apps
        "$mod,TAB, exec, alacritty"
        "$mod, E, exec, nemo"
        "$mod, S, exec, firefox"
        "$mod, X, exec, keepassxc"
        "$mod, M, exec, mw -Y && alacritty -e neomutt"
        "$mod, N, exec, alacritty -e newsboat"
        "$mod, A, exec, rofi -show drun"
        "$mod, F, exec, freetube"
        "$mod, C, exec, hyprpicker -a"
        "$mod+Shift, W, exec, sh  $sciPath/vm.sh"
        "$mod+Shift, Z, exec, grim - | swappy -f -"
        "$mod, Z, exec, sh $sciPath/screen.sh"
        "$mod, V, exec, cliphist list | rofi -dmenu | cliphist decode | wl-copy"
        "$mod, O, exec, sh $sciPath/mpv.sh"

        # controles
        "$mod, Q, killactive"
        "$mod, W, togglefloating"
        "$mod, R, togglesplit"
        "$mod+shift, S, exec, systemctl suspend"
        "$mod+shift, M, exit, hyprland"
        "$mod, G, exec, sh $sciPath/gamemode.sh"
        "$mod+shift, B, exec, sh $sciPath/ags.sh"
        "$mod, up, exec, sh $sciPath/volume.sh -i"
        "$mod, down, exec, sh $sciPath/volume.sh -d"
        "$mod, P, exec, hyprctl dispatch togglefloating && hyprctl dispatch pin"

        # cmus
        "$mod, D, exec, sh $sciPath/cmus.sh"
        "$mod, space, exec, playerctl play-pause"
        "$mod, comma, exec, playerctl previous"
        "$mod, period, exec, playerctl next"
        "$mod, equal, exec, cmus-remote -v +10%"
        "$mod, minus, exec, cmus-remote -v -10%"

        # Move focus
        "$mod, Return, fullscreen"
        "$mod, H, movefocus, l"
        "$mod, L, movefocus, r"
        "$mod, K, movefocus, u"
        "$mod, J, movefocus, d"

        # Window resizing              X  Y
        "CTRL+SHIFT, H, resizeactive, -60 0"
        "CTRL+SHIFT, L, resizeactive,  60 0"
        "CTRL+SHIFT, K, resizeactive,  0 -60"
        "CTRL+SHIFT, J, resizeactive,  0  60"

        # Moving windows
        "$mod SHIFT, H, swapwindow, l"
        "$mod SHIFT, L, swapwindow, r"
        "$mod SHIFT, K, swapwindow, u"
        "$mod SHIFT, J, swapwindow, d"

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
      };

      device = {
        name = "at-translated-set-2-keyboard";
        repeat_rate = "50";
      };
    };
  };
}
