{ pkgs, ... }: {
  home.packages = with pkgs; [
    rofi-wayland
    pavucontrol
    swww
    wl-clipboard
    cliphist
    grim
    slurp
    hyprpicker
    swappy
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    
    settings = {
      "$mod" = "SUPER";
    
        dwindle = {
          pseudotile = true;
          preserve_split = true;
        };
    
      monitor = [
        "eDP-1,2560x1440@165.00Hz,0x0,1.25"
        "DP-1,2560x1440@165.00Hz,0x0,1,bitdepth,10"
      ];
     

      env = [
        "HYPRCURSOR_THEME = Bibata-Modern-Ice"
        "HYPRCURSOR_SIZE = 24"
        "QT_QPA_PLATFORMTHEME,gtk2"
        "QT_STYLE_OVERRIDE,gtk2"
      ];

      exec-once = [
        "ags -c ~/nix/home/ags/bar/config.js &"
        "wl-paste --type text --watch cliphist store"
        "wl-paste --type image --watch cliphist store"
      ];
    

      bind = [
      
        # launch Apps
        "$mod,TAB, exec, alacritty"
        "$mod, E, exec, nemo"
        "$mod, S, exec, firefox"
        "$mod, X, exec, keepassxc"
        "$mod, M, exec, mbsync -a && alacritty -e neomutt" 
        "$mod, A, exec, rofi -show drun"
        "$mod, F, exec, freetube"
        "$mod, C, exec, hyprpicker -a"
        "$mod+Shift, W, exec, bash ~/nix/home/hyprland/vm.sh"
        "$mod+Shift, Z, exec, grim - | swappy -f -"
        "$mod, Z, exec, sh ~/nix/home/hyprland/screen.sh"
        "$mod, V, exec, cliphist list | rofi -dmenu | cliphist decode | wl-copy"
      
        # controles 
        "$mod, Q, killactive"
        "$mod, W, togglefloating"
        "$mod, R, togglesplit"
        "$mod+shift, S, exec, systemctl suspend"
        "$mod+shift, M, exit, hyprland"
        "$mod, G, exec, sh ~/nix/home/hyprland/gamemode.sh"

        # cmus
        "$mod, D, exec, sh ~/nix/home/hyprland/cmus.sh"
        "$mod, P, exec, cmus-remote --pause"
        "$mod, comma, exec, cmus-remote --prev"
        "$mod, period, exec, cmus-remote --next"
        "$mod, equal, exec, cmus-remote -v +5%"
        "$mod, minus, exec, cmus-remote -v -5%"
      
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
        ", XF86AudioRaiseVolume, exec, amixer set Master 5%+"
        ", XF86AudioLowerVolume, exec, amixer set Master 5%-"
      ];

      general = {
        gaps_in = 5;  
        gaps_out = 20;
        border_size = 2;
        allow_tearing = false;
        layout = "master";
      };

      misc ={
        disable_hyprland_logo = true;
        disable_splash_rendering = true;
      };

      decoration = {
        rounding = 5;
      };

      input = {
        kb_layout = "us,de";
        kb_variant = ",qwerty";
        kb_options = "grp:alt_shift_toggle";
      };
    
    };
  
  };

}

