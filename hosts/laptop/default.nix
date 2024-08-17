{ inputs, pkgs, ... }:
{
  networking.hostName = "laptop";
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

  
  environment.systemPackages = with pkgs; [
    prismlauncher
  ];
  imports = [
    ../../modules
    ./hardware.nix
    inputs.home-manager.nixosModules.default
  ];
}
