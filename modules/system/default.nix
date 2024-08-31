{pkgs, ...}: {
  users.users.joy = {
    isNormalUser = true;
    description = "joy";
    extraGroups = ["wheel" "docker"];
  };

  fonts.packages = with pkgs; [
    font-awesome
    (nerdfonts.override {fonts = ["FiraCode"];})
  ];

  nix.settings.experimental-features = ["nix-command" "flakes"];
  programs.nix-ld.enable = true;
  services.printing.enable = true;
  time.timeZone = "Europe/Zurich";
  system.stateVersion = "23.11";
  home-manager.backupFileExtension = "backup";
  home-manager.users.joy.home = {
    username = "joy";
    homeDirectory = "/home/joy";
    stateVersion = "23.11";
    sessionVariables = {
    };
  };

  services.devmon.enable = true;
  services.udisks2.enable = true;
  services.gvfs.enable = true;

  home-manager.users.joy.programs.home-manager.enable = true;

  home-manager.users.joy.xdg.mimeApps.defaultApplications = {
    "text/plain" = ["helix.desktop"];
    "image/*" = ["imv.desktop"];
    "video/png" = ["mpv.desktop"];
    "video/jpg" = ["mpv.desktop"];
    "video/*" = ["mpv.desktop"];
  };
}
