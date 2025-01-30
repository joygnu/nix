{
  networking.hostName = "mail";

  boot.loader.grub.enable = true;
  boot.loader.grub.device = "nodev";

  networking.enable = true;
  mail-server.enable = true;

  imports = [
    ./hardware.nix
    ../../modules
  ];
}
