{username, ...}: {
  networking.hostName = "laptop";

  led.enable = true;
  gnome.enable = true;
  home-manager.users.${username} = {
    code.enable = true;
    hypridle.enable = true;
  };

  imports = [
    ./hardware.nix
    ../../modules
  ];
}
