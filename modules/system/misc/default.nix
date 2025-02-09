{pkgs, ...}: {
  nix.settings.experimental-features = ["nix-command" "flakes"];
  time.timeZone = "Europe/Zurich";
  system.stateVersion = "23.11";
  services.xserver.excludePackages = [pkgs.xterm];
  programs.nano.enable = false;
}
