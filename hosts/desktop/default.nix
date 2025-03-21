{
  networking.hostName = "desktop";

  boot.loader.systemd-boot.enable = true;

  amd-gpu.enable = true;
  bluetooth.enable = true;
  calendar.enable = true;
  contact.enable = true;
  sync.enable = true;
  cmus.enable = true;
  emulator.enable = true;
  firefox.enable = true;
  gdm.enable = true;
  gnome.enable = true;
  hyprland.enable = true;
  vnc.enable = true;
  mpv.enable = true;
  email.enable = true;
  newsboat.enable = true;
  norisk.enable = true;
  obs.enable = true;
  openrgb.enable = true;
  polkit.enable = true;
  steam.enable = true;
  stylix.enable = true;
  syncthing-client.enable = true;
  zathura.enable = true;
  virtualisation.provider = "qemu";

  imports = [./hardware.nix];
}
