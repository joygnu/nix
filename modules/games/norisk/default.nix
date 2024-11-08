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
        version = "0.5.11";

        src = pkgs.fetchurl {
          url = "https://github.com/NoRiskClient/noriskclient-launcher/releases/download/v0.5.11/NoRiskClient-Linux.AppImage";
          hash = "sha256-Y0TSMQkJhpEgOgPbJwEK3vW85qYnnj69bRp5V7lhd/Q=";
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
