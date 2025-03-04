{
  networking.hostName = "mail";

  boot.loader.grub.enable = true;
  boot.loader.grub.device = "nodev";

  mail-server.enable = true;

  networking.firewall.allowedTCPPorts = [80 443];

  imports = [
    ./hardware.nix
    ../../modules
  ];
}
