{
  lib,
  config,
  username,
  ...
}: {
  config = lib.mkIf config.hyprland.enable {
    home-manager.users.${username} = {
      programs.hyprlock = {
        enable = true;
      };
    };
  };
}
