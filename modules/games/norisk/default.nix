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
      noriskclient = pkgs.appimageTools.wrapType1 {
        name = "noriskclient";
        version = "0.5.13";

        src = pkgs.fetchurl {
          url = "https://github.com/NoRiskClient/noriskclient-launcher/releases/download/v0.5.13/NoRiskClient-Linux.AppImage";
          hash = "sha256-Zg5kgoOLvBKyphYA32E+Jd4uGgYGQEameDFF85eiejA=";
        };
      };
    };
  iconurl = "https://raw.githubusercontent.com/NoRiskClient/noriskclient-launcher/refs/heads/main/src/images/norisk_logo.png";
  iconsha256 = "sha256-VwWwShUrT055mcabS8QTqqb8INgRB/08U2qEEIVYHlg=";
in {
  config = lib.mkIf config.games.enable {
    environment.systemPackages = [
      customPkgs.noriskclient
    ];

    home-manager.users.${username}.xdg = {
      desktopEntries = {
        NoRiskClient = {
          name = "NoRisk Client";
          exec = "noriskclient";
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
