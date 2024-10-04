{inputs, ...}: {
  home-manager.users.joy = {
    imports = [inputs.ags.homeManagerModules.default];
    programs.ags = {
      enable = true;
      configDir = ./bar;
    };
  };
}
