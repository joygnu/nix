{ inputs, ... }:
{
  networking.hostName = "laptop";
  networking.networkmanager.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  imports = [
    ../../modules
    ./hardware.nix
    inputs.home-manager.nixosModules.default
  ];
}
