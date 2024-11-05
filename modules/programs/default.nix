{inputs, ...}: {
  home-manager = {
    extraSpecialArgs = {inherit inputs;};
    users = {
      "joy" = import ./home.nix;
      "root" = import ./root.nix;
    };
  };
}
