{ config, lib, pkgs, modulesPath, inputs, ... }:
{
  networking.hostName = "laptop";
  networking.networkmanager.enable = true;
  #boot.loader.systemd-boot.enable = true;
  #boot.loader.efi.canTouchEfiVariables = true;
  boot.loader = {
  efi = {
    canTouchEfiVariables = true;
    efiSysMountPoint = "/boot/efi"; # ← use the same mount point here.
  };
  grub = {
     efiSupport = true;
     #efiInstallAsRemovable = true; # in case canTouchEfiVariables doesn't work for your system
     device = "nodev";
  };
};
  imports = [
     ../../modules
    ./hardware.nix
    inputs.home-manager.nixosModules.default
  ];
}
