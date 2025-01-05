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
      no-risk-client = pkgs.appimageTools.wrapType1 {
        pname = "no-risk-client";
        version = "0.5.20";

        src = pkgs.fetchurl {
          url = "https://github.com/NoRiskClient/noriskclient-launcher/releases/download/v0.5.20/NoRiskClient-Linux.AppImage";
          hash = "sha256-BqP0I/WHoLKdQvE/jDp98DQeVtojBd0hfsAJ0afp94g=";
        };
      };
    };
  iconurl = "https://raw.githubusercontent.com/NoRiskClient/noriskclient-launcher/refs/heads/main/src/images/norisk_logo.png";
  iconsha256 = "sha256-VwWwShUrT055mcabS8QTqqb8INgRB/08U2qEEIVYHlg=";
in {
  options = {
    norisk.enable = lib.mkEnableOption "";
  };
  config = lib.mkIf config.norisk.enable {
    environment.systemPackages = [
      customPkgs.no-risk-client
    ];

    home-manager.users.${username}.xdg = {
      desktopEntries = {
        no-risk-client = {
          name = "no-risk-client";
          exec = "no-risk-client";
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
