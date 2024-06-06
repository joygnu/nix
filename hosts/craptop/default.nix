{ config, lib, pkgs, modulesPath, inputs, ... }:
{
  networking.hostName = "craptop";
  networking.networkmanager.enable = true;
  
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/nvme0n1";
  boot.loader.grub.useOSProber = true;
  services.blueman.enable = true;
  hardware.bluetooth.enable = true;
  imports = [
     ../../modules
    ./hardware.nix
    inputs.home-manager.nixosModules.default
  ];
}
