{
  outputs = inputs @ {
    self,
    nixpkgs,
    nix-on-droid,
    ags,
    stylix,
    home-manager,
    sops-nix,
    ...
  }: let
    username = "joy";
    domain = "joygnu.org";
    mail = "contact@joygnu.org";
    nixpath = "nix/";

    nixosconf = {modules}:
      nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit inputs;
          inherit username;
          inherit domain;
          inherit mail;
          inherit nixpath;
        };
        modules = modules ++ [home-manager.nixosModules.default sops-nix.nixosModules.sops];
      };
  in {
    nixOnDroidConfigurations.default = nix-on-droid.lib.nixOnDroidConfiguration {
      pkgs = import nixpkgs {system = "aarch64-linux";};
      modules = [./hosts/phone];
      extraSpecialArgs = {
        inherit inputs;
        inherit username;
        inherit domain;
        inherit mail;
        inherit nixpath;
      };
    };
    nixosConfigurations = {
      desktop = nixosconf {
        modules = [./hosts/desktop];
      };
      laptop = nixosconf {
        modules = [./hosts/laptop];
      };
      server = nixosconf {
        modules = [./hosts/server];
      };
      iso = nixosconf {
        modules = [./hosts/iso];
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
      url = "github:nix-community/home-manager";
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
