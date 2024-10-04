{
  networking.hostName = "laptop";
  # services.xserver.desktopManager.gnome.enable = true;

  hypridle.enable = true;
  led.enable = true;

  imports = [
    ../../modules
    ./hardware.nix
  ];
}
