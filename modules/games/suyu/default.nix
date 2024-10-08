{
  pkgs,
  lib,
  config,
  ...
}: let
  customPkgs =
    pkgs
    // {
      suyu = pkgs.appimageTools.wrapType1 {
        name = "suyu";
        version = "0.0.3";

        src = pkgs.fetchurl {
          url = "https://git.suyu.dev/suyu/suyu/releases/download/v0.0.3/Suyu-Linux_x86_64.AppImage";
          hash = "sha256-26sWhTvB6K1i/K3fmwYg5pDIUi+7xs3dz8yVj5q7H0c=";
        };
      };
    };
in {
  options = {
    suyu.enable = lib.mkEnableOption "";
  };
  config = lib.mkIf config.suyu.enable {
    environment.systemPackages = [
      customPkgs.suyu
    ];

    home-manager.users.joy.xdg = {
      desktopEntries = {
        suyu = {
          name = "Suyu";
          exec = "suyu";
          icon = "suyu";
          terminal = false;
          type = "Application";
          categories = ["Game" "Emulator"];
          mimeType = ["text/plain"];
        };
      };
    };
  };
}
