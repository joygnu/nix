{
  lib,
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
in {
  environment.systemPackages = [
    customPkgs.noriskclient
  ];

  home-manager.users.joy.xdg = {
    desktopEntries = {
      NoRiskClient = {
        name = "NoRisk Client";
        exec = "noriskclient";
        icon = lib.mkForce "/home/joy/nix/modules/apps/gui/games/norisk/norisk.png";
        terminal = false;
        type = "Application";
        categories = ["Game"];
        mimeType = ["text/plain"];
      };
    };
  };
}
