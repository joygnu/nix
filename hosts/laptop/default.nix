{
  networking.hostName = "laptop";

  hypridle.enable = true;
  led.enable = true;
  code.enable = true;
  gnome.enable = true;

  imports = [
    ./hardware.nix
    ../../modules
  ];
}
