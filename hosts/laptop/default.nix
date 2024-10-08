{
  networking.hostName = "laptop";

  hypridle.enable = true;
  led.enable = true;
  gnome.enable = true;
  code.enable = true;
  # code.enable = true;

  imports = [
    ./hardware.nix
    ../../modules
  ];
}
