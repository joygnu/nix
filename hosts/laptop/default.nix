{
  networking.hostName = "laptop";

  boot.loader.systemd-boot.enable = true;

  led.enable = true;
  gnome.enable = true;
  virtual-box.enable = true;
  bluetooth.enable = true;
  qemu.enable = true;
  syncthing-client.enable = true;
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
  networking.enable = true;

  imports = [
    ./hardware.nix
    ../../modules
  ];
}
