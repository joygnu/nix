{ config, lib, pkgs, ... }: {
  home.packages = with pkgs; [
    rofi-wayland
    pavucontrol
    swww
    wl-clipboard
    cliphist
    lxqt.lxqt-policykit
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
    
      monitor = "DP-1,2560x1440@165.00Hz,0x0,1,bitdepth,10";
     
      env = [
        "HYPRCURSOR_THEME = Bibata-Modern-Ice"
        "HYPRCURSOR_SIZE = 24"
      ];

      exec-once = [
        "lxqt-policykit-agent &"
        "swww init &"
        "swww img ~/nix/home/hyprland/wallpaper.png &" 
        "ags -c ~/nix/home/ags/config.js &"
        "wl-paste --type text --watch cliphist store"
        "wl-paste --type image --watch cliphist store"
        "screen -dmS cmus cmus &"
      ];
    

      bind = [
      
        # launch Apps
        "$mod, TAB, exec, alacritty"
        "$mod, E, exec, nemo"
        "$mod, S, exec, brave"
        "$mod, X, exec, keepassxc"
        "$mod, D, exec, alacritty -e screen -r cmus"
        "$mod, F, exec, freetube"
        "$mod, M, exec, mbsync -a && alacritty -e neomutt"
        "$mod, C, exec, hyprpicker -a"
        "$mod, A, exec, rofi -show drun"
        "$mod+Shift, Z, exec, grim - | swappy -f -"
        "$mod, Z, exec, sh ~/nix/home/hyprland/screen.sh"
        "$mod, V, exec, cliphist list | rofi -dmenu | cliphist decode | wl-copy"
      
        # controles 
        "$mod, Q, killactive"
        "$mod, W, togglefloating"
        "$mod, R, togglesplit"
        "$mod, K, exec, amixer -q sset Master 5%+"
        "$mod, J, exec, amixer -q sset Master 5%-"
        "$mod+shift, S, exec, systemctl suspend"
        "$mod+shift, M, exit, hyprland"

        # cmus
        "$mod, P, exec, cmus-remote --pause"
        "$mod, comma, exec, cmus-remote --prev"
        "$mod, period, exec, cmus-remote --next"
        "$mod, equal, exec, cmus-remote -v +5%"
        "$mod, minus, exec, cmus-remote -v -5%"
      
        # Move focus 
        "$mod, Return, fullscreen"
        "$mod, left, movefocus, l"
        "$mod, right, movefocus, r"
        "$mod, up, movefocus, u"
        "$mod, down, movefocus, d"

        # Window resizing                     X  Y
        "CTRL+SHIFT, left,  resizeactive, -60 0"
        "CTRL+SHIFT, right, resizeactive,  60 0"
        "CTRL+SHIFT, up,    resizeactive,  0 -60"
        "CTRL+SHIFT, down,  resizeactive,  0  60"

        # Moving windows
        "$mod SHIFT, left,  swapwindow, l"
        "$mod SHIFT, right, swapwindow, r"
        "$mod SHIFT, up,    swapwindow, u"
        "$mod SHIFT, down,  swapwindow, d"
      
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
    
      bindm= [
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
      ];

      general = {
        gaps_in = 0;  
        gaps_out = 0;
        border_size = 3;
        "col.active_border" = "0xFFEBDBB2";
        "col.inactive_border" = "0xFF363537";
        allow_tearing = false;
        layout = "dwindle";
      };

      misc ={
        disable_hyprland_logo = true;
        disable_splash_rendering = true;
      };

      decoration = {
        rounding = 0;
      };

      input = {
        kb_layout = "us,de";
        kb_variant = ",qwerty";
        kb_options = "grp:alt_shift_toggle";
      };
    
      animations = {
        enabled = false;
      };
    
    };
  
  };

}

