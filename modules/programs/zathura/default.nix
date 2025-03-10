{
  username,
  lib,
  config,
  ...
}: {
  options = {
    zathura.enable = lib.mkEnableOption "";
  };
  config = lib.mkIf config.zathura.enable {
    home-manager.users.${username} = {
      programs.zathura = {
        enable = true;
        mappings = {
          p = "print";
        };
      };
    };
  };
}
