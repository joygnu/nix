{pkgs, ...}: {
  nix.settings.experimental-features = ["nix-command" "flakes"];
  time.timeZone = "Europe/Zurich";
  system.stateVersion = "23.11";
  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;
  services.xserver.excludePackages = [pkgs.xterm];
  programs.nano.enable = false;
  programs.java.enable = true;
}
