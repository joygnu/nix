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
  virtualisation.provider = "qemu";

  imports = [./hardware.nix];
}
