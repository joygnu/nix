{...}: {
  nix.settings.experimental-features = ["nix-command" "flakes"];
  time.timeZone = "Europe/Zurich";
  system.stateVersion = "23.11";
  services.logind.powerKey = "ignore";
}
