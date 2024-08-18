{ inputs, ... }:
{
  networking.hostName = "desktop";
  networking.networkmanager.enable = true;
  boot.loader.systemd-boot.enable = true;
  services.hardware.openrgb.enable = true; 

  imports = [
    ../../modules
    ./hardware.nix
    ./unfree.nix
    inputs.home-manager.nixosModules.default
  ];
}
