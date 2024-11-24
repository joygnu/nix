{
  networking.hostName = "desktop";

  openrgb.enable = true;
  emulator.enable = true;
  steam.enable = true;
  norisk.enable = true;
  amd-gpu.enable = true;
  gnome.enable = true;
  bluetooth.enable = true;
  systemd-boot.enable = true;
  qemu.enable = true;
  sync-client.enable = true;

  imports = [
    ./hardware.nix
    ../../modules
  ];
}
