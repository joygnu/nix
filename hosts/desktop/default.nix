{
  networking.hostName = "desktop";

  openrgb.enable = true;
  games.enable = true;
  lact.enable = true;
  gnome.enable = true;

  imports = [
    ./hardware.nix
    ../../modules
  ];
}
