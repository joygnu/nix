{...}: {
  networking.hostName = "desktop";
  networking.networkmanager.enable = true;
  boot.loader.systemd-boot.enable = true;
  services.hardware.openrgb.enable = true;

  games.enable = true;

  imports = [
    ../../modules
    ./hardware.nix
  ];
}
