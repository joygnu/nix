{...}: {
  home-manager.users.joy.xdg = {
    mimeApps = {
      enable = true;
      defaultApplications = {
        "text/plain" = ["hx.desktop"];
        "image/*" = ["imv.desktop"];
        "video/*" = ["mpv.desktop"];
      };
    };
  };
}
