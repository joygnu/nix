{
  networking.hostName = "old";

  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";

  services.logind.lidSwitch = "ignore";

  vpn-home.enable = true;

  imports = [./hardware.nix];
}
