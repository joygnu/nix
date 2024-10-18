{
  networking.hostName = "laptop";

  hypridle.enable = true;
  led.enable = true;
  gnome.enable = true;
  home-manager.users.joy.code.enable = true;

  imports = [
    ./hardware.nix
    ../../modules
  ];
}
