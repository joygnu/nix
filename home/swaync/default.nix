{pkgs, ...}: {
  services.swaync = {
    enable = true;
    settings = {
      positionX = "right";
      positionY = "top";
      layer = "overlay";
      control-center-layer = "top";
      layer-shell = true;
      cssPriority = "application";
      control-center-margin-top = 20;
      control-center-margin-bottom = 20;
      control-center-margin-right = 20;
      control-center-margin-left = 20;
      notification-2fa-action = true;
      notification-inline-replies = false;
      notification-icon-size = 64;
      notification-body-image-height = 100;
      notification-body-image-width = 200;
      timeout = 3;
      timeout-low = 2;
      timeout-critical = 0;
      fit-to-screen = false;
      control-center-width = 500;
      control-center-height = 1365;
      notification-window-width = 440;
      keyboard-shortcuts = true;
      image-visibility = "when-available";
      transition-time = 200;
      hide-on-clear = true;
      hide-on-action = true;
      script-fail-notify = true;

      widgets = [
        "title"
        "dnd"
        "notifications"
        "mpris"
        "volume"
        "buttons-grid"
      ];

      widget-config = {
        title = {
          text = "Notification Center";
          clear-all-button = true;
          button-text = "󰆴 Clear All";
        };
        dnd = {
          text = "Do Not Disturb";
        };
        label = {
          max-lines = 1;
          text = "Notification Center";
        };
        mpris = {
          image-size = 96;
          image-radius = 7;
        };
        volume = {
          label = "󰕾";
          show-per-app = true;
        };
        buttons-grid = {
          actions = [
            {
              label = "󰐥";
              command = "systemctl poweroff";
            }
            {
              label = "󰜉";
              command = "systemctl reboot";
            }
            {
              label = "󰍃";
              command = "hyprctl dispatch exit";
            }
            {
              label = "󰤄";
              command = "systemctl suspend";
            }
            {
              label = "󰕾";
              command = "swayosd-client --output-volume mute-toggle";
            }
            {
              label = "󰍬";
              command = "swayosd-client --input-volume mute-toggle";
            }
            {
              label = "󰂯";
              command = "blueman-manager";
            }
          ];
        };
      };
    };
    style = 
    ''

@define-color cc-bg #282828;
@define-color noti-border-color #32302f;
@define-color noti-bg #3c3836;
@define-color noti-bg-darker #3c3836;
@define-color noti-bg-hover rgb(27, 27, 43);
@define-color noti-bg-focus rgba(27, 27, 27, 0.6);
@define-color text-color #f9f5d7;
@define-color text-color-disabled #bdae93;
@define-color bg-selected #fabd2f;
 * {
    font-family: JetBrainsMono NFP;
    font-weight: bold;
	font-size: 14px
}
 .control-center .notification-row:focus,
.control-center .notification-row:hover {
    opacity: 1;
    background: @noti-bg-darker
}
 .notification-row {
    outline: none;
    margin: 20px;
    padding: 0;
}
 .notification {
    background: transparent;
    margin: 0px;
}
 .notification-content {
    background: @cc-bg;
    padding: 7px;
    border-radius: 0px;
    border: 2px solid #85796f;
    margin: 0;
}
 .close-button {
    background: #d79921;
    color: @cc-bg;
    text-shadow: none;
    padding: 0;
    border-radius: 0px;
    margin-top: 5px;
    margin-right: 5px;
}
 .close-button:hover {
    box-shadow: none;
    background: #fabd2f;
    transition: all .15s ease-in-out;
    border: none
}
 .notification-action {
    color: #ebdbb2;
    border: 2px solid #85796f;
    border-top: none;
    border-radius: 0px;
    background: #32302F;
}
 .notification-default-action:hover,
.notification-action:hover {
    color: #ebdbb2;
    background: #32302F;
}
 .summary {
	padding-top: 7px;
    font-size: 13px;
    color: #ebdbb2;
}
 .time {
    font-size: 11px;
    color: #d79921;
    margin-right: 24px
}
 .body {
    font-size: 12px;
    color: #ebdbb2;
}
 .control-center {
    background: @cc-bg;
    border: 2px solid #4E8A8D;
    border-radiu
}
 .control-center-list {
    background: transparent
}
 .control-center-list-placeholder {
    opacity: .5
}
 .floating-notifications {
    background: transparent
}
 .blank-window {
    background: alpha(black, 0.1)
}
 .widget-title {
    color: #f9f5d7;
    background: @noti-bg-darker;
    padding: 5px 10px;
    margin: 10px 10px 5px 10px;
    font-size: 1.5rem;
    border-radius: 5px;
}
 .widget-title>button {
    font-size: 1rem;
    color: @text-color;
    text-shadow: none;
    background: @noti-bg;
    box-shadow: none;
    border-radius: 5px;
}
 .widget-title>button:hover {
    background: #d79921;
    color: @cc-bg;
}
 .widget-dnd {
    background: @noti-bg-darker;
    padding: 5px 10px;
    margin: 5px 10px 10px 10px;
    border-radius: 5px;
    font-size: large;
    color: #f2e5bc;
}
 .widget-dnd>switch {
    border-radius: 4px;
    background: #665c54;
}
 .widget-dnd>switch:checked {
    background: #d79921;
    border: 1px solid #d79921;
}
 .widget-dnd>switch slider {
    background: @cc-bg;
    border-radius: 5px
}
 .widget-dnd>switch:checked slider {
    background: @cc-bg;
    border-radius: 5px
}
 .widget-label {
    margin: 10px 10px 5px 10px;
}
 .widget-label>label {
    font-size: 1rem;
    color: @text-color;
}
 .widget-mpris {
    color: @text-color;
    background: @noti-bg-darker;
    padding: 5px 10px 0px 0px;
    margin: 5px 10px 5px 10px;
    border-radius: 0px;
}
 .widget-mpris > box > button {
    border-radius: 5px;
}
 .widget-mpris-player {
    padding: 5px 10px;
    margin: 10px
}
 .widget-mpris-title {
    font-weight: 700;
    font-size: 1.25rem
}
 .widget-mpris-subtitle {
    font-size: 1.1rem
}
 .widget-buttons-grid {
    font-size: x-large;
    padding: 5px;
    margin: 5px 10px 10px 10px;
    border-radius: 5px;
    background: @noti-bg-darker;
}
 .widget-buttons-grid>flowbox>flowboxchild>button {
    margin: 3px;
    background: @cc-bg;
    border-radius: 5px;
    color: @text-color
}
 .widget-buttons-grid>flowbox>flowboxchild>button:hover {
    background: #d79921;
    color: @cc-bg;
}
 .widget-menubar>box>.menu-button-bar>button {
    border: none;
    background: transparent
      }
 .topbar-buttons>button {
    border: none;
    background: transparent
}
  ''
    ;
  };

  home.packages = with pkgs; [
    libnotify
  ];
}