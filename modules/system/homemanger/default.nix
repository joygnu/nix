{...}: {
  home-manager.users.joy.programs.home-manager.enable = true;
  home-manager.users.joy.xresources.path = ".config/.Xresources";
  home-manager.users.joy.gtk.gtk2.configLocation = "/home/joy/.config/gtk-2.0/gtkrc";
  # home-manager.users.joy.xdg = {
    # mimeApps = {
      # enable = true;
      # defaultApplications = {
        # "text/plain" = ["hx.desktop"];
        # "image/*" = ["imv.desktop"];
        # "video/png" = ["mpv.desktop"];
        # "video/jpg" = ["mpv.desktop"];
        # "video/*" = ["mpv.desktop"];
      # };
    # };
  # };

  home-manager.backupFileExtension = "backup";
  home-manager.users.joy.home = {
    username = "joy";
    homeDirectory = "/home/joy";
    stateVersion = "23.11";
    sessionVariables = {
    };
  };
}
