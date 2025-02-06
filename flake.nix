{
  outputs = inputs @ {
    self,
    nixpkgs,
    nixpkgs-stable,
    nixpkgs-24-05,
    nix-on-droid,
    ags,
    stylix,
    home-manager,
    sops-nix,
    simple-nixos-mailserver,
    ...
  }: let
    username = "joy";
    domain = "joygnu.org";
    mail = "mail@joygnu.org";
    nixpath = "~/nix";
    system = "x86_64-linux";
    pkgs-stable = nixpkgs-stable.legacyPackages.${system};

    specialArgs = {
      inherit inputs username domain mail nixpath pkgs-stable;
    };

    mkNixosConfig = {modules}:
      nixpkgs.lib.nixosSystem {
        inherit system specialArgs;
        modules = modules ++ [home-manager.nixosModules.default];
      };
  in {
    nixOnDroidConfigurations.phone = nix-on-droid.lib.nixOnDroidConfiguration {
      pkgs = import nixpkgs-24-05 {system = "aarch64-linux";};
      modules = [./hosts/phone];
      extraSpecialArgs = specialArgs;
    };

    nixosConfigurations = {
      desktop = mkNixosConfig {modules = [./hosts/desktop];};
      laptop = mkNixosConfig {modules = [./hosts/laptop];};
      server = mkNixosConfig {modules = [./hosts/server];};
      mail = mkNixosConfig {modules = [./hosts/mail];};
    };
  };
  description = "NixOS and Nix-on-Droid configurations for joy";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-24.11";
    nixpkgs-24-05.url = "github:NixOS/nixpkgs/nixos-24.05";
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
    simple-nixos-mailserver = {
      url = "gitlab:simple-nixos-mailserver/nixos-mailserver/nixos-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-minecraft = {
      url = "github:Infinidoge/nix-minecraft";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
}
