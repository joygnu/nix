{
  pkgs,
  username,
  lib,
  config,
  ...
}: {
  options = {
    virtualisation.provider = lib.mkOption {
      type = lib.types.enum ["qemu" "virtual-box"];
      default = "qemu";
      description = "";
    };
  };

  config = lib.mkMerge [
    (lib.mkIf (config.virtualisation.provider == "virtual-box") {
      virtualisation.virtualbox.host = {
        enable = true;
      };

      users.extraGroups.vboxusers.members = ["${username}"];
      boot.blacklistedKernelModules = ["kvm" "kvm-intel" "kvm-amd"];
    })

    (lib.mkIf (config.virtualisation.provider == "qemu") {
      users.users.${username}.extraGroups = ["libvirtd"];

      programs.virt-manager.enable = true;

      virtualisation = {
        libvirtd = {
          enable = true;
          qemu = {
            swtpm.enable = true;
            ovmf.enable = true;
            vhostUserPackages = [pkgs.virtiofsd];
          };
        };
        spiceUSBRedirection.enable = true;
      };

      services.spice-vdagentd.enable = true;
    })
  ];
}
