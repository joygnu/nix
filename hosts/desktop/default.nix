{ inputs, ... }:
{
  networking.hostName = "desktop";
  networking.networkmanager.enable = true;

  boot.loader = {
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot/efi";
    };
    grub = {
       efiSupport = true;
       device = "nodev";
    };
  };
  
  services.hardware.openrgb.enable = true; 

  imports = [
    ../../modules
    ./hardware.nix
    ./unfree.nix
    inputs.home-manager.nixosModules.default
  ];
}
