{
  networking.hostName = "server";

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  forgejo.enable = true;
  immich.enable = true;
  nginx.enable = true;
  radicale.enable = true;
  syncthing-server.enable = true;
  searx.enable = true;
  vpn-home.enable = true;
  homepage.enable = true;
  duplicati.enable = true;
  gatus.enable = true;
  cockpit.enable = true;
  minecraft-server.enable = true;
  invidious.enable = true;
  redlib.enable = true;
  virtualisation.provider = "qemu";

  imports = [./hardware.nix];
}
