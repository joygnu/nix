{ inputs, pkgs, ... }:
{
  networking.hostName = "laptop";
  networking.networkmanager.enable = true;

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  
  environment.systemPackages = with pkgs; [
    prismlauncher
  ];
  imports = [
    ../../modules
    ./hardware.nix
    ./unfree.nix
    inputs.home-manager.nixosModules.default
  ];
}
