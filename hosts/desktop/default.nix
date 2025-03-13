{
  networking.hostName = "desktop";

  boot.loader.systemd-boot.enable = true;

  ags.enable = true;
  amd-gpu.enable = true;
  bluetooth.enable = true;
  calendar.enable = true;
  clip.enable = true;
  cmus.enable = true;
  dunst.enable = true;
  emulator.enable = true;
  firefox.enable = true;
  foot.enable = true;
  gdm.enable = true;
  gnome.enable = true;
  hyprland.enable = true;
  mpv.enable = true;
  neomutt.enable = true;
  newsboat.enable = true;
  norisk.enable = true;
  obs.enable = true;
  openrgb.enable = true;
  polkit.enable = true;
  rofi.enable = true;
  steam.enable = true;
  stylix.enable = true;
  syncthing-client.enable = true;
  zathura.enable = true;
  virtualisation.provider = "qemu";

  imports = [
    ./hardware.nix
    ../../modules
  ];
}
