{ inputs, ... }:
{
  networking.hostName = "desktop";
  networking.networkmanager.enable = true;
  services.hardware.openrgb.enable = true; 
 
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  imports = [
    ../../modules
    ./hardware.nix
    inputs.home-manager.nixosModules.default
  ];
}
