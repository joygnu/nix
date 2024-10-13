{
  networking.hostName = "desktop";

  openrgb.enable = true;
  games.enable = true;
  lact.enable = true;

  imports = [
    ./hardware.nix
    ../../modules
  ];
}
