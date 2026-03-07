{
  config,
  lib,
  pkgs,
  username,
  ...
}: let
  inherit (lib) mkEnableOption mkIf getExe;

  cfg = config.minecraft;

  ninjabrain-bot = pkgs.fetchurl {
    url = "https://github.com/Ninjabrain1/Ninjabrain-Bot/releases/download/1.5.1/Ninjabrain-Bot-1.5.1.jar";
    sha256 = "sha256-Rxu9A2EiTr69fLBUImRv+RLC2LmosawIDyDPIaRcrdw=";
  };
in {
  options.minecraft = {
    enable = mkEnableOption "Minecraft with PrismLauncher + Waywall";
  };

  config = mkIf cfg.enable {
    home-manager.users.${username} = {
      home.packages = with pkgs; [
        (prismlauncher.override {
          jdks = [
            temurin-jre-bin-8
            temurin-jre-bin-17
            temurin-jre-bin-21
          ];
          additionalLibs = [
            libXt
            libXtst
            libxkbcommon
          ];
        })

        waywall
      ];

      home.file.".config/waywall/init.lua".text =
        # lua
        ''
          local waywall = require("waywall")
          local helpers = require("waywall.helpers")

          local resolution_toggle = true

          local config = {
            theme = {
              background = "#282828ff",
              ninb_anchor = "topright",
            },
            input = {
              layout = "us",
              remaps = {
                ["tab"] = "F3",
                ["capslock"] = "esc",
              },
              repeat_rate = 40,
              repeat_delay = 300,
              confine_pointer = false,
            },
          }

          config.actions = {
            ["Shift-G"] = function()
              if resolution_toggle then
                waywall.set_resolution(2560, 1440)
              else
                waywall.set_resolution(800, 1440)
              end
              resolution_toggle = not resolution_toggle
            end,

            ["Ctrl-Shift-N"] = function()
              waywall.exec("${getExe pkgs.temurin-jre-bin-17} -jar ${ninjabrain-bot}")
            end,

            ["Shift-N"] = function()
              helpers.toggle_floating()
            end,
          }

          return config
        '';
    };
  };
}
