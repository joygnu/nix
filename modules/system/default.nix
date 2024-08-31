{...}: {

  nix.settings.experimental-features = ["nix-command" "flakes"];
  time.timeZone = "Europe/Zurich";
  system.stateVersion = "23.11";

  services.devmon.enable = true;
  services.udisks2.enable = true;
  services.printing.enable = true;
  services.gvfs.enable = true;

    imports = [
    ./user
    ./homemanger
  ];

}
