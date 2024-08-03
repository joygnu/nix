{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
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

  outputs = { nixpkgs, home-manager, stylix, ... }@inputs: let
    systemConfig = { modules }: nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs; };
      modules = modules ++ [ stylix.nixosModules.stylix ];
    };
  in {
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
