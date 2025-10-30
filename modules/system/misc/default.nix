{
  pkgs,
  timezone,
  ...
}: {
  nix.settings.experimental-features = ["nix-command" "flakes"];
  time.timeZone = timezone;
  system.stateVersion = "23.11";
  services.xserver.excludePackages = [pkgs.xterm];
  programs.nano.enable = false;
  nix.settings.auto-optimise-store = true;
  environment.systemPackages = with pkgs; [
    zip
    wget
    unzip
    yt-dlp
  ];
}
