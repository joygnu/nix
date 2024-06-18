{ config, lib, pkgs, modulesPath, inputs, ... }:
{
  networking.hostName = "laptop";
  networking.networkmanager.enable = true;
  hardware.nvidia.nvidiaSettings = true;
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  imports = [
     ../../modules
    ./hardware.nix
    inputs.home-manager.nixosModules.default
  ];
}
