{...}: {
  networking.hostName = "desktop";
  services.hardware.openrgb.enable = true;

  imports = [
    ../../modules
    ./hardware.nix
    ../../modules/apps/gui/games
  ];
}
