{
  lib,
  config,
  username,
  ...
}: {
  config = lib.mkIf config.hyprland.enable {
    home-manager.users.${username} = {
      programs.foot = {
        enable = true;
        settings = {
          main = {
            pad = "2x2";
            font = lib.mkForce "RobotoMono Nerd Font:size=12";
          };
        };
      };
    };
  };
}
