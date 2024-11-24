{
  networking.hostName = "server";

  services.logind.lidSwitch = "ignore";
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";
  sync-server.enable = true;
  nginx.enable = true;
  forgejo.enable = true;
  immich.enable = true;
  docker.enable = true;

  imports = [
    ./hardware.nix
    ../../modules/programs
    ../../modules/system
    ../../modules/secrets
    ../../modules/services
  ];
}
