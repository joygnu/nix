{...}: {
  home-manager.users.joy.xdg = {
    desktopEntries = {
      hx = {
        name = "Helix";
        exec = "alacritty -e hx %F";
        icon = "helix";
        terminal = false;
        type = "Application";
        categories = ["Utility" "TextEditor"];
        mimeType = ["text/plain"];
      };
    };
    mimeApps = {
      enable = true;
      defaultApplications = {
        "text/plain" = ["hx.desktop"];
        "image/*" = ["imv.desktop"];
        "video/*" = ["mpv.desktop"];
      };
    };
    userDirs = {
      enable = false;
      desktop = "~/media/pic/screen";
      download = "~/dl";
    };
  };
}
