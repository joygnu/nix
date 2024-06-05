{ config, lib, pkgs, modulesPath, inputs, ... }:
{
  networking.hostName = "pc";
  networking.networkmanager.enable = true;
  services.xserver.videoDrivers = ["amdgpu"];
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.timeout = 0;
  
  imports = [
    ../../modules
    ./hardware.nix
    inputs.home-manager.nixosModules.default
  ];
}
