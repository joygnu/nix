{
  networking.hostName = "desktop";

  openrgb.enable = true;
  games.enable = true;

  imports = [
    ./hardware.nix
    ../../modules
  ];
}
