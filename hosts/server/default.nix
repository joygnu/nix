{
  networking.hostName = "server";

  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";

  services.logind.lidSwitch = "ignore";

  forgejo.enable = true;
  immich.enable = true;
  nginx.enable = true;
  radicale.enable = true;
  syncthing-server.enable = true;
  redlib.enable = true;
  home-assistant.enable = true;
  searx.enable = true;
  invidious.enable = true;

  imports = [./hardware.nix];
}
