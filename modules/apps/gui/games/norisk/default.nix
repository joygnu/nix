{lib, pkgs, ...}: let
  customPkgs =
    pkgs
    // {
      noriskclient = pkgs.appimageTools.wrapType1 {
        name = "noriskclient";
        version = "0.5.6";

        src = pkgs.fetchurl {
          url = "https://github.com/NoRiskClient/noriskclient-launcher/releases/download/v0.5.6/NoRiskClient-Linux.AppImage";
          hash = "sha256-viZUbm7cwueFB2Hp+uJ/QICXzO+oDTU6ODaOXwyCIb4=";
        };
      };
    };
in {
  environment.systemPackages = [
    customPkgs.noriskclient
  ];

  home-manager.users.joy.xdg = {
    desktopEntries = {
      NoRiskClient= {
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
