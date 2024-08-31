{...}: {
  home-manager.users.joy.programs.home-manager.enable = true;

  home-manager.users.joy.xdg.mimeApps.defaultApplications = {
    "text/plain" = ["helix.desktop"];
    "image/*" = ["imv.desktop"];
    "video/png" = ["mpv.desktop"];
    "video/jpg" = ["mpv.desktop"];
    "video/*" = ["mpv.desktop"];
  };
  
  home-manager.backupFileExtension = "backup";
  home-manager.users.joy.home = {
    username = "joy";
    homeDirectory = "/home/joy";
    stateVersion = "23.11";
    sessionVariables = {
    };
  };
}
