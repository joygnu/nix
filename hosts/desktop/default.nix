{ inputs, lib, pkgs, ... }:
{
  programs.steam.enable = true;
  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
             "steam"
           ];
  environment.systemPackages = with pkgs; [
    prismlauncher
    mangohud
    lutris
  ];

  networking.hostName = "desktop";
  networking.networkmanager.enable = true;
  services.hardware.openrgb.enable = true; 
  
  boot.loader = {
   timeout = 0;
    efi.canTouchEfiVariables = false;
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
