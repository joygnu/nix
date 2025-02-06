{
  networking.hostName = "server";

  sync-server.enable = true;
  nginx.enable = true;
  forgejo.enable = true;
  immich.enable = true;
  docker.enable = true;
  minecraft-server.enable = true;
  networking.enable = true;

  services.logind.lidSwitch = "ignore";
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";

  imports = [
    ./hardware.nix
    ../../modules
  ];
}
