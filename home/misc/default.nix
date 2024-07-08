
{  ... }:

{
home.username = "joy";
  home.homeDirectory = "/home/joy";
  home.stateVersion = "23.11"; 
  programs.home-manager.enable = true;
  home.sessionVariables = {
  EDITOR = "nvim";
};
  qt.enable = true;
  qt.platformTheme.name = "gtk";
  qt.style.name = "adwaita-dark";

  xdg.mimeApps.defaultApplications = {
    "text/plain" = ["neovide.desktop"];
    "image/*" = ["imv.desktop"];
    "video/png" = ["mpv.desktop"];
    "video/jpg" = ["mpv.desktop"];
    "video/*" = ["mpv.desktop"];
  };
}
