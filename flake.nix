{
  outputs = inputs @ {
    self,
    nixpkgs,
    nixpkgs-stable,
    nix-on-droid,
    ags,
    stylix,
    home-manager,
    sops-nix,
    ...
  }: let
    username = "joy";
    domain = "joygnu.org";
    mail = "mail@joygnu.org";
    nixpath = "~/nix";
    pkgs-stable = nixpkgs-stable.legacyPackages.x86_64-linux;

    nixosconf = {modules}:
      nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit inputs;
          inherit username;
          inherit domain;
          inherit mail;
          inherit nixpath;
          inherit pkgs-stable;
        };
        modules = modules ++ [home-manager.nixosModules.default sops-nix.nixosModules.sops stylix.nixosModules.stylix];
      };
  in {
    nixOnDroidConfigurations.default = nix-on-droid.lib.nixOnDroidConfiguration {
      pkgs = import nixpkgs-stable {system = "aarch64-linux";};
      modules = [./hosts/phone];
      extraSpecialArgs = {
        inherit inputs;
        inherit username;
        inherit domain;
        inherit mail;
        inherit nixpath;
        inherit pkgs-stable;
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
    };
  };

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-24.11";
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
      url = "github:Aylur/ags/v1";
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
