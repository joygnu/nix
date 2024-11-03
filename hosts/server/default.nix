{
  networking.hostName = "server";
  services.logind.lidSwitch = "ignore";
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";

  imports = [
    ./hardware.nix
    ../../modules/programs
    ../../modules/system
    ../../modules/secrets
    ../../modules/services
    ../../modules/services/invidious
    ../../modules/services/forgejo
    ../../modules/services/syncthing
    ../../modules/services/immich
    ../../modules/services/nginx
  ];
}
