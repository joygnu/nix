{
  networking.hostName = "server";
  services.logind.lidSwitch = "ignore";
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";
  boot.loader.grub.useOSProber = true;
  imports = [
    ./hardware.nix
    ../../modules/programs
    ../../modules/system
  ];
}
