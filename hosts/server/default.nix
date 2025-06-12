{
  networking.hostName = "server";

  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";

  services.logind.lidSwitch = "ignore";

  imports = [./hardware.nix];
}
