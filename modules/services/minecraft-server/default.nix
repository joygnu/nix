{
  inputs,
  pkgs,
  lib,
  config,
  ...
}: {
  imports = [inputs.nix-minecraft.nixosModules.minecraft-servers];

  options = {
    minecraft-server.enable = lib.mkEnableOption "";
  };
  config = lib.mkIf config.minecraft-server.enable {
    nixpkgs.overlays = [inputs.nix-minecraft.overlay];
    services.minecraft-servers = {
      enable = true;
      eula = true;
      openFirewall = true;
      servers.fabric = {
        enable = true;
        package =
          pkgs.fabricServers.fabric-1_21_4.override {
          };

        symlinks = {
          mods = pkgs.linkFarmFromDrvs "mods" (builtins.attrValues {
            Fabric-API = pkgs.fetchurl {
              url = "https://cdn.modrinth.com/data/P7dR8mSH/versions/UnrycCWP/fabric-api-0.115.1%2B1.21.4.jar";
              sha512 = "1en4dnm17cl4bmUfxIH4hhqc9T7TgYkKHLXhKSItbF+pnwYEUAf44fugLaaGzbbbLZmzNKHSOIHLVt+hmZMu6g==";
            };
            Chunky = pkgs.fetchurl {
              url = "https://cdn.modrinth.com/data/fALzjamp/versions/VkAgASL1/Chunky-Fabric-1.4.27.jar";
              sha512 = "qJ+UlH58OZLgHka+iWfSplkzNDM6VGtP/1/bAqH1prg8k63Exyqbmx8U+Sme/KqKXX9e7t89pUHH5yq8Xickxg==";
            };
          });
        };
      };
    };
    nixpkgs.config.allowUnfreePredicate = pkg:
      builtins.elem (lib.getName pkg) [
        "minecraft-server"
      ];
  };
}
