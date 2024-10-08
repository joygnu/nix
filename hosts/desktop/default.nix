{
  networking.hostName = "desktop";

  openrgb.enable = true;
  steam.enable = true;
  suyu.enable = true;
  norisk.enable = true;

  imports = [
    ./hardware.nix
    ../../modules
  ];
}
