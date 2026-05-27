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
  sync.enable = true;
  mpv.enable = true;
  polkit.enable = true;
  syncthing-client.enable = true;
  zathura.enable = true;
  vesktop.enable = true;
  steam.enable = true;
  spotify.enable = true;
  vpn.location = "home";
  virtualisation.provider = "client";

  imports = [./hardware.nix];
}
