{
  lib,
  config,
  username,
  pkgs,
  ...
}: {
  options = {
    mpv.enable = lib.mkEnableOption "";
  };
  imports = [./link.nix];
  config = lib.mkIf config.mpv.enable {
    home-manager.users.${username} = {
      programs.mpv = {
        enable = true;
        bindings = {
          x = "add speed 0.1";
          z = "add speed -0.1";
          "," = "frame-back-step";
          "." = "frame-step";
          space = "cycle-values speed 1 2";
          DOWN = "add volume -5";
          UP = "add volume 5";
        };
        scripts = with pkgs.mpvScripts; [
          mpris
          sponsorblock
        ];
      };
    };
  };
}
