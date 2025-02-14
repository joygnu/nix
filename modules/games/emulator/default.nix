{
  pkgs,
  lib,
  config,
  username,
  ...
}: {
  options = {
    emulator.enable = lib.mkEnableOption "";
  };
  config = lib.mkIf config.emulator.enable {
    environment.systemPackages = with pkgs; [
      cemu
      suyu
    ];

    home-manager.users.${username}.xdg = {
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
