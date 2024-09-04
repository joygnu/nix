{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    ags.url = "github:Aylur/ags";
    stylix.url = "github:danth/stylix";
    hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";

    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs = {
    nixpkgs,
    home-manager,
    stylix,
    hyprland,
    ...
  } @ inputs: let
    systemConfig = {modules}:
      nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        modules = modules ++ [stylix.nixosModules.stylix];
      };
  in {
    nixosConfigurations = {
      desktop = systemConfig {
        modules = [./hosts/desktop];
      };
      laptop = systemConfig {
        modules = [./hosts/laptop];
      };
    };
  };
}
