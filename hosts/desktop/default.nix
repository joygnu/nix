{...}: {
  networking.hostName = "desktop";
  services.hardware.openrgb.enable = true;

  games.enable = true;

  imports = [
    ../../modules
    ./hardware.nix
  ];
}
