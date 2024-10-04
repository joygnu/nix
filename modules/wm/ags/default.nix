{inputs, ...}: {
  home-manager.users.joy.imports = [inputs.ags.homeManagerModules.default];
  home-manager.users.joy.programs.ags = {
    enable = true;
    configDir = ./bar;
  };
}
