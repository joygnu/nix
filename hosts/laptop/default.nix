{username, ...}: {
  networking.hostName = "laptop";
  virtualisation.virtualbox.host.enable = true;
  led.enable = true;
  gnome.enable = true;
  home-manager.users.${username} = {
    hypridle.enable = true;
  };

  imports = [
    ./hardware.nix
    ../../modules
  ];
}
