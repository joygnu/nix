{pkgs, ...}: {
  nix.settings.experimental-features = ["nix-command" "flakes"];
  time.timeZone = "Europe/Zurich";
  system.stateVersion = "23.11";
  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;
}
