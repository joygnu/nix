{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    nixpkgs-stable = {
      url = "github:NixOS/nixpkgs/nixos-25.05";
    };

    nixpkgs-master = {
      url = "github:NixOS/nixpkgs/master";
    };

    nixpkgs-24-05 = {
      url = "github:NixOS/nixpkgs/nixos-24.05";
    };

    nixpkgs-24-11 = {
      url = "github:NixOS/nixpkgs/nixos-24.11";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-on-droid = {
      url = "github:nix-community/nix-on-droid/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix = {
      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    simple-nixos-mailserver = {
      url = "gitlab:simple-nixos-mailserver/nixos-mailserver/main";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-minecraft = {
      url = "github:Infinidoge/nix-minecraft";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    ninjabrain-bot = {
      url = "git+https://tangled.org/althaea.zone/ninjabrain-bot-nix?ref=trunk";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        mcsr-nixos.follows = "mcsr-nixos";
      };
    };

    mcsr-nixos = {
      url = "git+https://git.uku3lig.net/uku/mcsr-nixos?ref=main";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixcord = {
      url = "github:kaylorben/nixcord";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs @ {
    nixpkgs,
    nixpkgs-stable,
    nixpkgs-master,
    nixpkgs-24-05,
    nixpkgs-24-11,
    home-manager,
    nix-on-droid,
    mcsr-nixos,
    spicetify-nix,
    ...
  }: let
    system = "x86_64-linux";

    username = "joy";
    timezone = "Europe/Zurich";
    nixpath = "~/nix";

    domain = {
      a = "joygnu.org";
      b = "xn--xck.xyz";
    };

    mail = {
      a = "contact";
      b = "mail";
      c = "spyware";
    };

    mkPkgs = src:
      import src {
        inherit system;
        config.allowUnfree = true;
      };

    pkgs-stable = mkPkgs nixpkgs-stable;
    pkgs-master = mkPkgs nixpkgs-master;
    pkgs-24-05 = mkPkgs nixpkgs-24-05;
    pkgs-24-11 = mkPkgs nixpkgs-24-11;

    specialArgs = {
      inherit
        inputs
        username
        timezone
        domain
        mail
        nixpath
        pkgs-stable
        pkgs-master
        pkgs-24-05
        pkgs-24-11
        mcsr-nixos
        spicetify-nix
        ;
    };

    mkNixosConfig = {modules}:
      nixpkgs.lib.nixosSystem {
        inherit system specialArgs;

        modules =
          modules
          ++ [
            {nixpkgs.config.allowUnfree = true;}

            ./modules

            home-manager.nixosModules.home-manager

            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;

              home-manager.sharedModules = [
                inputs.nixcord.homeModules.nixcord
                inputs.ninjabrain-bot.homeModules.default
              ];
            }
          ];
      };
  in {
    nixosConfigurations = {
      desktop = mkNixosConfig {modules = [./hosts/desktop];};
      laptop = mkNixosConfig {modules = [./hosts/laptop];};
      server = mkNixosConfig {modules = [./hosts/server];};
      mail = mkNixosConfig {modules = [./hosts/mail];};
    };

    nixOnDroidConfigurations.phone = nix-on-droid.lib.nixOnDroidConfiguration {
      pkgs = import nixpkgs-24-05 {
        system = "aarch64-linux";
        config.allowUnfree = true;
      };

      modules = [./hosts/phone];
      extraSpecialArgs = specialArgs;
    };
  };
}
