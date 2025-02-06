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
              sha512 = "3m2x4wrl7gmdjw1739a2d5kk4nxpdndhsk2v87vw7w0fl040sgsjpvc5li2kqdm3h58k0fk7vsrq6l6z20w87v5drwckvdmg5vgisfm";
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
