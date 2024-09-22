{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    nix-on-droid = {
      url = "github:nix-community/nix-on-droid/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    ags.url = "github:Aylur/ags";
    stylix.url = "github:danth/stylix";

    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nix-on-droid, ags, stylix, home-manager, ... } @ inputs: let
    systemConfig = { modules }:
      nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
        modules = modules ++ [stylix.nixosModules.stylix home-manager.nixosModules.default];
      };
  in {
    nixOnDroidConfigurations.default = nix-on-droid.lib.nixOnDroidConfiguration {
      pkgs = import nixpkgs { system = "aarch64-linux"; };
      modules = [ .hosts/phone];
    };

    nixosConfigurations = {
      desktop = systemConfig {
        modules = [ ./hosts/desktop ];
      };
      laptop = systemConfig {
        modules = [ ./hosts/laptop ];
      };
    };
  };
}
