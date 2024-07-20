{ inputs, ... }:
{
  networking.hostName = "desktop";
  networking.networkmanager.enable = true;
  
  boot.loader = {
  efi = {
    canTouchEfiVariables = false;
  };
  grub = {
      efiSupport = true;
      efiInstallAsRemovable = true;
      device = "nodev";
    };
  };
 
  boot.loader.timeout = 5;
  
  imports = [
    ../../modules
    ./hardware.nix
    inputs.home-manager.nixosModules.default
  ];
}
