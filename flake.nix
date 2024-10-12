{
  outputs = {
    self,
    nixpkgs,
    nix-on-droid,
    ags,
    stylix,
    home-manager,
    sops-nix,
    ...
  } @ inputs: let
    systemConfig = {modules}:
      nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        modules = modules ++ [home-manager.nixosModules.default sops-nix.nixosModules.sops];
      };
  in {
    nixOnDroidConfigurations.default = nix-on-droid.lib.nixOnDroidConfiguration {
      pkgs = import nixpkgs {system = "aarch64-linux";};
      modules = [./hosts/phone];
    };
    nixosConfigurations = {
      desktop = systemConfig {
        modules = [./hosts/desktop];
      };
      laptop = systemConfig {
        modules = [./hosts/laptop];
      };
      server = systemConfig {
        modules = [./hosts/server];
      };
    };
  };
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:joygnu/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-on-droid = {
      url = "github:nix-community/nix-on-droid/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix = {
      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    ags = {
      url = "github:Aylur/ags";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    sops = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
}
