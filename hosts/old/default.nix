{
  networking.hostName = "old";

  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";

  services.logind.settings.Login.HandleLidSwitch = "ignore";

  vpn-home.enable = true;

  imports = [./hardware.nix];
}
