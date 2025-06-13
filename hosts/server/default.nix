{
  networking.hostName = "server";

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  vpn-home.enable = true;
  minecraft-server.enable = true;
  forgejo.enable = true;
  immich.enable = true;
  nginx.enable = true;
  radicale.enable = true;
  syncthing-server.enable = true;
  redlib.enable = true;
  searx.enable = true;
  invidious.enable = true;

  imports = [./hardware.nix];
}
