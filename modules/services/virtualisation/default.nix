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

      fileSystems."/media/server" = {
        device = "joy@joygnu.org:/home/joy";
        fsType = "fuse.sshfs";
        options = [
          "noauto"
          "x-systemd.automount"
          "x-systemd.idle-timeout=600"
          "_netdev"
          "reconnect"
          "ServerAliveInterval=15"
          "IdentityFile=/home/joy/.ssh/id_rsa"
          "allow_other"
          "uid=1000"
          "gid=100"
        ];
      };
      fileSystems."/media/share" = {
        device = "joy@joygnu.org:/home/joy/media/share";
        fsType = "fuse.sshfs";
        options = [
          "noauto"
          "x-systemd.automount"
          "x-systemd.idle-timeout=600"
          "_netdev"
          "reconnect"
          "ServerAliveInterval=15"
          "IdentityFile=/home/joy/.ssh/id_rsa"
          "allow_other"
          "uid=1000"
          "gid=100"
        ];
      };
      programs.fuse.userAllowOther = true;
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
          dbus.enable = true;
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
