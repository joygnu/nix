{
  inputs,
  pkgs,
  ...
}: {
  networking.hostName = "laptop";
  networking.networkmanager.enable = true;
  boot.loader.systemd-boot.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  imports = [
    ../../modules
    ./hardware.nix
    ./led.nix
    inputs.home-manager.nixosModules.default
  ];
}
