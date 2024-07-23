{ inputs, ... }:
{
  networking.hostName = "desktop";
  networking.networkmanager.enable = true;
  
  boot.loader = {
  timeout = 0;
  efi = {
    canTouchEfiVariables = false;
  };
  grub = {
      efiSupport = true;
      efiInstallAsRemovable = true;
      device = "nodev";
    };
  };
 
  imports = [
    ../../modules
    ./hardware.nix
    inputs.home-manager.nixosModules.default
  ];
}
