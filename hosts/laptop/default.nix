{username, ...}: {
  networking.hostName = "laptop";

  led.enable = true;
  gnome.enable = true;
  virtual-box.enalbe = true;
  bluetooth.enable = true;
  systemd-boot.enable = true;
  qemu.enable = true;
  sync-client.enable = true;
  home-manager.users.${username} = {
    hypridle.enable = true;
  };

  imports = [
    ./hardware.nix
    ../../modules
  ];
}
