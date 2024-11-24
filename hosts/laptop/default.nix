{
  networking.hostName = "laptop";

  led.enable = true;
  gnome.enable = true;
  virtual-box.enalbe = true;
  bluetooth.enable = true;
  systemd-boot.enable = true;
  qemu.enable = true;
  sync-client.enable = true;
  hypridle.enable = true;
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
  theme.enable = true;
  hyprland.enable = true;

  imports = [
    ./hardware.nix
    ../../modules
  ];
}
