{
  lib,
  config,
  pkgs,
  ...
}: let
  customPkgs =
    pkgs
    // {
      noriskclient = pkgs.appimageTools.wrapType1 {
        name = "noriskclient";
        version = "0.5.10";

        src = pkgs.fetchurl {
          url = "https://github.com/NoRiskClient/noriskclient-launcher/releases/download/v0.5.10/NoRiskClient-Linux.AppImage";
          hash = "sha256-y5kXP3kEW0UsV04JBeJCvSOuJf3/zo5s7ZigOpxbwkk=";
        };
      };
    };
  logourl = "https://raw.githubusercontent.com/NoRiskClient/noriskclient-launcher/refs/heads/main/src/images/norisk_logo.png";
  logsha256 = "sha256-VwWwShUrT055mcabS8QTqqb8INgRB/08U2qEEIVYHlg=";
in {
  config = lib.mkIf config.games.enable {
    environment.systemPackages = [
      customPkgs.noriskclient
    ];

    home-manager.users.joy.xdg = {
      desktopEntries = {
        NoRiskClient = {
          name = "NoRisk Client";
          exec = "noriskclient";
          icon = pkgs.fetchurl {
            url = logourl;
            sha256 = logsha256;
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
