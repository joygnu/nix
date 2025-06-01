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
      servers.test = {
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
            FerriteCore = pkgs.fetchurl {
              url = "https://cdn.modrinth.com/data/uXXizFIs/versions/IPM0JlHd/ferritecore-7.1.1-fabric.jar";
              sha512 = "9B3J6LKDJ6HimxRmfLQq5efhe8+kSVJg9vhRqA1LCNmKMNXFKxEAB+4yXwLax0MeP61FYMaECvC/NHr61IxarA==";
            };
            Lithium = pkgs.fetchurl {
              url = "https://cdn.modrinth.com/data/gvQqBUqZ/versions/u8pHPXJl/lithium-fabric-0.15.3%2Bmc1.21.4.jar";
              sha512 = "uLVBwOloVxyJcocrNC40uSVzvJIQ1FXcE0lYnzCmepDZMNv9mbF2q5sRA1DOtT4REYN43BOjXoOpCQgmYnvawA==";
            };
            Concurrent_Chunk_Management_Engine = pkgs.fetchurl {
              url = "https://cdn.modrinth.com/data/VSNURh3q/versions/EzvMx6b2/c2me-fabric-mc1.21.4-0.3.1.3.0.jar";
              sha512 = "+US/QxnPpvtkXQy+gHuCx0eE9E73rHUnPvoWG+RiWqgDkOyM8yojLA684NDLI7CQl5AZ2T51UHcd5W0J2SDdEw==";
            };
            Krypton = pkgs.fetchurl {
              url = "https://cdn.modrinth.com/data/fQEb0iXm/versions/Acz3ttTp/krypton-0.2.8.jar";
              sha512 = "X4z5bHm/1NiT8dcNpYLmICa+02r0mn+nseAPtu+yjZrWoe7BRwIElrT+OGk9M/5r/NHuu9k0dWEu5EKQwkg3hA==";
            };
            Noisium = pkgs.fetchurl {
              url = "https://cdn.modrinth.com/data/KuNKN7d2/versions/9NHdQfkN/noisium-fabric-2.5.0%2Bmc1.21.4.jar";
              sha512 = "MRn5Mlqc4T2FHU9u3aut44IiLIApYmZQahVfjhLzKhlaAKdcQKjQYuRDn1p+9m86+aRvnzs8t5nztmtzyi7e6A==";
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
