{
  networking.hostName = "server";

  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";

  networking.firewall.allowedTCPPorts = [80 443];

  services.logind.lidSwitch = "ignore";

  syncthing-server.enable = true;
  nginx.enable = true;
  forgejo.enable = true;
  immich.enable = true;
  docker.enable = true;
  minecraft-server.enable = true;

  imports = [
    ./hardware.nix
    ../../modules
  ];
}
