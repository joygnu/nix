{
  home-manager = {
    backupFileExtension = "bak";
    users.joy = {
      programs.home-manager.enable = true;
      xresources.path = ".config/.Xresources";
      gtk.gtk2.configLocation = "/home/joy/.config/gtk-2.0/gtkrc";
      home = {
        username = "joy";
        homeDirectory = "/home/joy";
        stateVersion = "23.11";
      };
    };
  };
}
