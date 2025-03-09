{
  lib,
  config,
  username,
  ...
}: {
  options = {
    foot.enable = lib.mkEnableOption "";
  };

  config = lib.mkIf config.foot.enable {
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
