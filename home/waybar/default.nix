{
  pkgs,
  config,
  ...
}: let
  workspaces = {
  };

  mainWaybarConfig = {
    mod = "dock";
    layer = "top";
    gtk-layer-shell = true;
    height = 14;
    position = "top";

    modules-left = ["hyprland/workspaces"];
    modules-center = ["clock"];
    modules-right = [
      "pulseaudio"
      "tray"
    ];

    "wlr/workspaces" = workspaces;
    "hyprland/workspaces" = workspaces;

    clock = {
      actions = {
        on-click-backward = "tz_down";
        on-click-forward = "tz_up";
        on-click-right = "mode";
        on-scroll-down = "shift_down";
        on-scroll-up = "shift_up";
      };
    };

    pulseaudio = {
      format = "{icon}  {volume}%";
        on-click = "pavucontrol";
      format-icons = {
        default = ["" "" ""];
      };
    };

    tray = {
      icon-size = 15;
      spacing = 5;
    };
  };
  css = ''

/* -----------------------------------------------------
 * General 
 * ----------------------------------------------------- */
* {
	font-size: 16px;
	font-family: Ubuntu Nerd Font, Font Awesome, sans-serif;
    font-weight: bold;
}

window#waybar {
	background-color: rgba(26,27,38,0.4);
    border-bottom: 1px solid rgba(26,27,38,0);
    border-radius: 0px;
	color: #f8f8f2;
}

/* -----------------------------------------------------
 * Workspaces 
 * ----------------------------------------------------- */
#workspaces {
	background: #fb4934;
    margin: 5px 3px 5px 12px;
    padding: 0px 1px;
    border-radius: 15px;
    border: 0px;
    font-style: normal;
    color: #15161e;
}

#workspaces button {
    padding: 0px 5px;
    margin: 4px 3px;
    border-radius: 15px;
    border: 0px;
    color: #15161e;
    background-color: #fb4934;
    opacity: 0.5;
    transition: all 0.3s ease-in-out;
}

#workspaces button.active {
    color: #15161e;
    background: #fb4934;
    border-radius: 15px;
    min-width: 40px;
    transition: all 0.3s ease-in-out;
    opacity: 1.0;
}

#workspaces button:hover {
    color: #15161e;
    background: #fb4934;
    border-radius: 15px;
    opacity: 1.0;
}


/* -----------------------------------------------------
 * Tooltips
 * ----------------------------------------------------- */
tooltip {
  background: #282828;
  border: 1px solid #282828;
  border-radius: 10px;
}

tooltip label {
  color: #15161e;
}

/* -----------------------------------------------------
 * Window
 * ----------------------------------------------------- */
#window {
    color: #15161e;
    background: #8ec07c;
    border-radius: 15px;
    margin: 5px;
    padding: 2px 10px;
}

#custom-packages {
    color: #15161e;
    background: #f7768e;
    border-radius: 15px;
    margin: 5px;
    padding: 2px 10px;
}

#memory {
    color: #15161e;
    background: #e0af68;
    border-radius: 15px;
    margin: 5px;
    padding: 2px 10px;
}
#clock {
    color: #15161e;
    background: #fabd2f;
    border-radius: 15px;
    margin: 5px;
    padding: 2px 10px;
}

#cpu {
    color: #15161e;
    background: #7dcfff;
    border-radius: 15px;
    margin: 5px;
    padding: 2px 10px;
}

#disk {
    color: #15161e;
    background: #9ece6a;
    border-radius: 15px;
    margin: 5px;
    padding: 2px 10px;
}

#battery {
    color: #15161e;
    background: #ff79c6;
    border-radius: 15px;
    margin: 5px;
    padding: 2px 10px;
}

#network {
    color: #15161e;
    background: #f1fa8c;
    border-radius: 15px;
    margin: 5px;
    padding: 2px 10px;
}

#tray {
    color: #15161e;
    background: #8EC07C;
    border-radius: 15px;
    margin: 5px;
    padding: 2px 10px;
}

#pulseaudio {
    color: #15161e;
    background: #83a598;
    border-radius: 15px;
    margin: 5px;
    padding: 2px 10px;
}

#custom-notification {
    color: #15161e;
    background: #6272a4;
    border-radius: 15px;
    margin: 5px;
    padding: 2px 10px;
}
'';
in {
  programs.waybar = {
    enable = true;
    package = pkgs.waybar.overrideAttrs (oldAttrs: {
      mesonFlags = oldAttrs.mesonFlags ++ ["-Dexperimental=true"];
    });
    style = css;
    settings = {mainBar = mainWaybarConfig;};
  };
}
