{
  networking.hostName = "vpn";

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  vpn-home.enable = true;
  minecraft-server.enable = true;

  imports = [./hardware.nix];
}
