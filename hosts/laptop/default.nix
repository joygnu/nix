{
  networking.hostName = "laptop";

  boot.loader.systemd-boot.enable = true;

  led.enable = true;
  gnome.enable = true;
  bluetooth.enable = true;
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
  hyprland.enable = true;
  neomutt.enable = true;
  zathura.enable = true;
  virtualisation.provider = "virtual-box";

  imports = [
    ./hardware.nix
    ../../modules
  ];
}
