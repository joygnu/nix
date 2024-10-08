{
  networking.hostName = "desktop";

  openrgb.enable = true;
  steam.enable = true;
  suyu.enable = true;
  norisk.enbale = true;

  imports = [
    ./hardware.nix
    ../../modules
  ];
}
