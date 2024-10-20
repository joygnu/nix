{
  networking.hostName = "laptop";

  led.enable = true;
  gnome.enable = true;
  home-manager.users.joy.code.enable = true;
  home-manager.users.joy.hypridle.enable = true;

  imports = [
    ./hardware.nix
    ../../modules
  ];
}
