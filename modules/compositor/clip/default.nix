{
  lib,
  config,
  username,
  pkgs,
  ...
}: {
  options = {
    clip.enable = lib.mkEnableOption "";
  };
  config = lib.mkIf config.clip.enable {
    home-manager.users.${username} = {
      home.packages = with pkgs; [
        wl-clipboard
      ];

      services.cliphist.enable = true;
    };
  };
}
