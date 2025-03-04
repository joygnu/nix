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
    users.users.${username}.extraGroups = ["libvirtd"];

    environment.systemPackages = with pkgs; [
      virt-manager
    ];

    virtualisation = {
      libvirtd = {
        enable = true;
        qemu = {
          swtpm.enable = true;
          ovmf.enable = true;
        };
      };
      spiceUSBRedirection.enable = true;
    };
    services.spice-vdagentd.enable = true;
  };
}
