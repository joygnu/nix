{ inputs, ... }:
{
  networking.hostName = "desktop";
  networking.networkmanager.enable = true;

  boot.loader = {
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot/efi"; # ← use the same mount point here.
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
    inputs.home-manager.nixosModules.default
  ];
}
