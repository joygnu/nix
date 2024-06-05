{ config, lib, pkgs, modulesPath, inputs, ... }:
{
  networking.hostName = "craptop";
  networking.networkmanager.enable = true;
  
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/nvme0n1";
  boot.loader.grub.useOSProber = true;

  imports = [
     ../../modules
    ./hardware.nix
    inputs.home-manager.nixosModules.default
  ];
}
