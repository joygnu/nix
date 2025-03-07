{
  networking.hostName = "desktop";

  boot.loader.systemd-boot.enable = true;

  openrgb.enable = true;
  emulator.enable = true;
  steam.enable = true;
  norisk.enable = true;
  amd-gpu.enable = true;
  gnome.enable = true;
  bluetooth.enable = true;
  syncthing-client.enable = true;
  foot.enable = true;
  mpv.enable = true;
  ags.enable = true;
  firefox.enable = true;
  clip.enable = true;
  rofi.enable = true;
  dunst.enable = true;
  polkit.enable = true;
  xdg.enable = true;
  gdm.enable = true;
  hyprland.enable = true;
  obs.enable = true;
  mail-sync.enable = true;
  cmus.enable = true;
  virtualisation.provider = "qemu";

  imports = [
    ./hardware.nix
    ../../modules
  ];
}
