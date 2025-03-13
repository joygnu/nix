{
  networking.hostName = "laptop";

  boot.loader.systemd-boot.enable = true;

  ags.enable = true;
  bluetooth.enable = true;
  calendar.enable = true;
  clip.enable = true;
  dunst.enable = true;
  firefox.enable = true;
  foot.enable = true;
  gdm.enable = true;
  gnome.enable = true;
  hypridle.enable = true;
  hyprland.enable = true;
  led.enable = true;
  mpv.enable = true;
  neomutt.enable = true;
  newsboat.enable = true;
  polkit.enable = true;
  rofi.enable = true;
  syncthing-client.enable = true;
  xdg.enable = true;
  zathura.enable = true;
  virtualisation.provider = "virtual-box";

  imports = [
    ./hardware.nix
    ../../modules
  ];
}
