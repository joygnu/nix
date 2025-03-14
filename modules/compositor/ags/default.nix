{
  lib,
  config,
  username,
  inputs,
  ...
}: {
  imports = [./reload.nix];
  config = lib.mkIf config.hyprland.enable {
    home-manager.users.${username} = {
      imports = [inputs.ags.homeManagerModules.default];
      programs.ags = {
        enable = true;
        configDir = ./bar;
      };
    };
  };
}
