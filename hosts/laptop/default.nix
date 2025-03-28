{
  networking.hostName = "laptop";

  boot.loader.systemd-boot.enable = true;

  bluetooth.enable = true;
  calendar.enable = true;
  contact.enable = true;
  firefox.enable = true;
  gdm.enable = true;
  gnome.enable = true;
  hypridle.enable = true;
  hyprland.enable = true;
  led.enable = true;
  email.enable = true;
  vnc.enable = true;
  cmus.enable = true;
  sync.enable = true;
  mpv.enable = true;
  newsboat.enable = true;
  polkit.enable = true;
  syncthing-client.enable = true;
  stylix.enable = true;
  zathura.enable = true;
  mysql.enable = true;
  virtualisation.provider = "qemu";

  imports = [./hardware.nix];
}
