{
  pkgs,
  username,
  lib,
  config,
  ...
}: {
  options = {
    virtualisation.provider = lib.mkOption {
      type = lib.types.enum ["qemu" "virtual-box" "none" "client"];
      default = "none";
      description = "";
    };
  };

  config = lib.mkMerge [
    (lib.mkIf (config.virtualisation.provider == "none") {
      })

    (lib.mkIf (config.virtualisation.provider == "client") {
      programs.virt-manager.enable = true;
    })

    (lib.mkIf (config.virtualisation.provider == "virtual-box") {
      virtualisation.virtualbox.host = {
        enable = true;
      };

      users.extraGroups.vboxusers.members = ["${username}"];
      boot.blacklistedKernelModules = ["kvm" "kvm-intel" "kvm-amd"];
    })

    (lib.mkIf (config.virtualisation.provider == "qemu") {
      users.users.${username}.extraGroups = ["libvirtd"];
      virtualisation = {
        libvirtd = {
          enable = true;
          qemu = {
            swtpm.enable = true;
            vhostUserPackages = [pkgs.virtiofsd];
          };
        };
        spiceUSBRedirection.enable = true;
      };

      services.spice-vdagentd.enable = true;
    })
  ];
}
