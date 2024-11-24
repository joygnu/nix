{
  pkgs,
  username,
  lib,
  config,
  ...
}: {
  options = {
    qemu.enable = lib.mkEnableOption "";
  };
  config = lib.mkIf config.qemu.enable {
    programs.dconf.enable = true;

    users.users.${username}.extraGroups = ["libvirtd"];

    environment.systemPackages = with pkgs; [
      virt-manager
      virt-viewer
      spice
      spice-gtk
      spice-protocol
      win-virtio
      win-spice
      virtiofsd
      freerdp
    ];

    virtualisation = {
      libvirtd = {
        enable = true;
        qemu = {
          swtpm.enable = true;
          ovmf.enable = true;
          ovmf.packages = [pkgs.OVMFFull.fd];
        };
      };
      spiceUSBRedirection.enable = true;
    };
    services.spice-vdagentd.enable = true;
  };
}
