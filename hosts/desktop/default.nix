{
  networking.hostName = "desktop";

  openrgb.enable = true;

  imports = [
    ./hardware.nix
    ../../modules
    ../../modules/games
  ];
}
