{
  networking.hostName = "mail";

  boot.loader.grub.enable = true;
  boot.loader.grub.device = "nodev";

  networking.firewall.allowedTCPPorts = [80 443];

  mail-server.enable = true;

  imports = [./hardware.nix];
}
