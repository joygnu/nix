{...}: {
  home-manager.users.joy.programs.home-manager.enable = true;

  home-manager.users.joy.xdg.mimeApps.defaultApplications = {
    "text/plain" = ["helix.desktop"];
    "image/*" = ["imv.desktop"];
    "video/png" = ["mpv.desktop"];
    "video/jpg" = ["mpv.desktop"];
    "video/*" = ["mpv.desktop"];
  };
}
