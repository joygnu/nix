{
  lib,
  config,
  pkgs,
  username,
  ...
}: let
  customPkgs =
    pkgs
    // {
      norisk-client = pkgs.appimageTools.wrapType1 {
        pname = "norisk-client";
        version = "0.5.22";

        src = pkgs.fetchurl {
          url = "https://github.com/NoRiskClient/noriskclient-launcher/releases/download/v0.5.22/NoRiskClient-Linux.AppImage";
          hash = "sha256-HZar1+0CyIgmWxZgNcc4gwpSI1md2JJy32kWDl70syw=";
        };
      };
    };
  iconurl = "https://raw.githubusercontent.com/NoRiskClient/noriskclient-launcher/refs/heads/main/src/images/norisk_logo.png";
  iconsha256 = "sha256-VwWwShUrT055mcabS8QTqqb8INgRB/08U2qEEIVYHlg=";
in {
  options = {
    minecraft.enable = lib.mkEnableOption "";
  };
  config = lib.mkIf config.minecraft.enable {
    environment.systemPackages = [
      customPkgs.norisk-client
      pkgs.prismlauncher
    ];

    home-manager.users.${username}.xdg = {
      desktopEntries = {
        norisk-client = {
          name = "norisk-client";
          exec = "norisk-client";
          icon = pkgs.fetchurl {
            url = iconurl;
            sha256 = iconsha256;
          };
          terminal = false;
          type = "Application";
          categories = ["Game"];
          mimeType = ["text/plain"];
        };
      };
    };
  };
}
