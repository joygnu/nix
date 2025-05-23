{
  outputs = inputs @ {
    nixpkgs,
    nixpkgs-stable,
    nixpkgs-master,
    nixpkgs-24-05,
    nix-on-droid,
    home-manager,
    ...
  }: let
    username = "joy";
    domain.a = "joygnu.org";
    domain.b = "xn--xck.xyz";
    mail.a = "contact";
    mail.b = "mail";
    mail.c = "spyware";
    nixpath = "~/nix";
    system = "x86_64-linux";
    timezone = "Europe/Zurich";
    pkgs-stable = nixpkgs-stable.legacyPackages.${system};
    pkgs-master = nixpkgs-master.legacyPackages.${system};

    specialArgs = {
      inherit inputs username timezone domain mail nixpath pkgs-stable pkgs-master;
    };

    mkNixosConfig = {modules}:
      nixpkgs.lib.nixosSystem {
        inherit system specialArgs;
        modules =
          modules
          ++ [
            ./modules
            home-manager.nixosModules.default
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;

              home-manager.sharedModules = [
                inputs.nixcord.homeModules.nixcord
              ];
            }
          ];
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
      vpn = mkNixosConfig {modules = [./hosts/vpn];};
    };
  };
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-24.11";
    nixpkgs-master.url = "github:NixOS/nixpkgs/master";
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
      url = "gitlab:simple-nixos-mailserver/nixos-mailserver/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-minecraft = {
      url = "github:Infinidoge/nix-minecraft";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixcord = {
      url = "github:kaylorben/nixcord";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
}
