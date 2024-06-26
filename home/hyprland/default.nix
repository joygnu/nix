{ config, lib, pkgs, ... }:
{
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
       "waybar &"
       "wl-paste --type text --watch cliphist store"
       "wl-paste --type image --watch cliphist store"
       "sh cmus.sh"
      ];
    

    bind = [
      
      # launch Apps
      "$mod, TAB, exec, alacritty"
      "$mod, E, exec, nemo"
      "$mod, S, exec, brave"
      "$mod, X, exec, keepassxc"
      "$mod, F, exec, freetube"
      "$mod, M, exec, thunderbird"
      "$mod, C, exec, hyprpicker -a"
      "$mod, A, exec, rofi -show drun"
      "$mod+Shift, Z, exec, grim - | swappy -f -"
      "$mod, Z, exec, sh ~/nix/home/hyprland/screen.sh"
      "$mod, V, exec, cliphist list | rofi -dmenu | cliphist decode | wl-copy"
      
      # controles 
      "$mod, Q, killactive"
      "$mod, W, togglefloating"
      "$mod, R, togglesplit"
      "$mod, L, exec, amixer -q sset Master 5%+"
      "$mod, K, exec, amixer -q sset Master 5%-"
      "$mod+shift, Y, exec, systemctl suspend"
      "$mod+shift, M, exit, hyprland"
      
      # mocp
      "$mod, P, exec, cmus-remote --pause"
      "$mod, comma, exec, cmus-remote --next"
      "$mod, period, exec, cmus-remote --prev"
      "$mod, equal, exec, cmus-remote -v +5%"
      "$mod, minus, exec, cmus-remote -v -5%"
      
      # Move focus with mainMod + arrow keys
      "$mod, Return, fullscreen"
      "$mod, left, movefocus, l"
      "$mod, right, movefocus, r"
      "$mod, up, movefocus, u"
      "$mod, down, movefocus, d"
      
      # Switch workspaces with mainMod + [0-9]
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
      
      # Move active window to a workspace with mainMod + SHIFT + [0-9]
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
      gaps_in = 1;  
      gaps_out = 1;
      border_size = 2;
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

  };
};
}

