{
  lib,
  config,
  username,
  inputs,
  ...
}: {
  options = {
    ags.enable = lib.mkEnableOption "";
  };
  config = lib.mkIf config.ags.enable {
    home-manager.users.${username} = {
      imports = [inputs.ags.homeManagerModules.default];
      programs.ags = {
        enable = true;
        configDir = ./bar;
      };
    };
  };
}
