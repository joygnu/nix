{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    hyprland.url = "github:hyprwm/Hyprland";
    stylix.url = "github:danth/stylix";
    nix-colors.url = "github:misterio77/nix-colors";
    suyu.url = "git+https://git.suyu.dev/suyu/nix-flake";
    suyu.inputs.nixpkgs.follows = "nixpkgs";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

     nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs = { nixpkgs, home-manager,stylix, ... }@inputs: {
    nixosConfigurations.pc = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs;};
      system = "x86_64-linux";
      modules = [
      ./hosts/pc
    #  inputs.stylix.nixosModules.stylix
      ];
    };
   nixosConfigurations.laptop = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs;};
      modules = [
      ./hosts/laptop
      ];
    };
   nixosConfigurations.craptop = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs;};
      modules = [
      ./hosts/craptop
      ];
    };
  };
}

