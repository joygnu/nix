{
  lib,
  config,
  username,
  pkgs,
  ...
}: {
  options = {
    rofi.enable = lib.mkEnableOption "";
  };
  config = lib.mkIf config.rofi.enable {
    home-manager.users.${username} = {
      programs.rofi = {
        enable = true;
        package = pkgs.rofi-wayland;
        theme = "/home/${username}/.config/rofi/theme.rasi";

        extraConfig = {
          display-drun = "";
          show-icons = true;
          terminal = "foot";
        };
      };
      home.file.".config/rofi/theme.rasi".text = ''
        * {
          gruv0: #${config.home-manager.users.${username}.stylix.base16Scheme.base00};
          gruv1: #${config.home-manager.users.${username}.stylix.base16Scheme.base01};
          gruv2: #${config.home-manager.users.${username}.stylix.base16Scheme.base02};
          gruv3: #${config.home-manager.users.${username}.stylix.base16Scheme.base03};
          gruv4: #${config.home-manager.users.${username}.stylix.base16Scheme.base07};
          gruv5: #${config.home-manager.users.${username}.stylix.base16Scheme.base06};
          gruv6: #${config.home-manager.users.${username}.stylix.base16Scheme.base05};
          gruv7: #${config.home-manager.users.${username}.stylix.base16Scheme.base0F};
          gruv8: #${config.home-manager.users.${username}.stylix.base16Scheme.base04};
          gruv9: #${config.home-manager.users.${username}.stylix.base16Scheme.base03};
          gruv10: #${config.home-manager.users.${username}.stylix.base16Scheme.base02};
          red: #${config.home-manager.users.${username}.stylix.base16Scheme.base08};
          orange: #${config.home-manager.users.${username}.stylix.base16Scheme.base09};
          yellow: #${config.home-manager.users.${username}.stylix.base16Scheme.base0A};
          aqua: #${config.home-manager.users.${username}.stylix.base16Scheme.base0C};
          purple: #${config.home-manager.users.${username}.stylix.base16Scheme.base0E};
          reddark: #${config.home-manager.users.${username}.stylix.base16Scheme.base08};
          yellowdark: #${config.home-manager.users.${username}.stylix.base16Scheme.base0A};
          foreground: @gruv9;
          background-color: transparent;
          highlight: underline bold #${config.home-manager.users.${username}.stylix.base16Scheme.base05};
          transparent: rgba(46,52,64,0);
        }

        window {
          location: center;
          anchor: center;
          border-radius: 10px;
          height: 560px;
          width: 600px;
          background-color: @transparent;
          spacing: 0;
          children: [mainbox];
          orientation: horizontal;
        }

        mainbox {
          spacing: 0;
          children: [ inputbar, message, listview ];
        }

        message {
          padding: 10px;
          border: 0px 2px 2px 2px;
          border-color: @gruv0;
          background-color: @gruv7;
        }

        inputbar {
          color: @gruv6;
          padding: 14px;
          background-color: @gruv0;
          border-color: @gruv0;
          border: 1px;
          border-radius: 10px 10px 0px 0px;
        }

        entry, prompt, case-indicator {
          text-font: inherit;
          text-color: inherit;
        }

        prompt {
          margin: 0px 1em 0em 0em;
        }

        listview {
          padding: 8px;
          border-radius: 0px 0px 10px 10px;
          border: 2px 2px 2px 2px;
          border-color: @gruv0;
          background-color: @gruv0;
          dynamic: false;
        }

        element {
          padding: 5px;
          vertical-align: 0.5;
          border-radius: 10px;
          color: @foreground;
          text-color: @gruv6;
          background-color: @gruv1;
        }

        element.normal.active {
          background-color: @yellow;
        }

        element.normal.urgent {
          background-color: @reddark;
        }

        element.selected.normal {
          background-color: @gruv7;
          text-color: @gruv0;
        }

        element.selected.active {
          background-color: @yellowdark;
        }

        element.selected.urgent {
          background-color: @red;
        }

        element.alternate.normal {
          background-color: @transparent;
        }

        element-text, element-icon {
          size: 3ch;
          margin: 0 10 0 0;
          vertical-align: 0.5;
          background-color: inherit;
          text-color: @gruv6;
        }

        button {
          padding: 6px;
          color: @foreground;
          horizontal-align: 0.5;
          border: 2px 0px 2px 2px;
          border-radius: 10px;
          border-color: @foreground;
        }

        button.selected.normal {
          border: 2px 0px 2px 2px;
          border-color: @foreground;
        }
      '';
    };
  };
}
