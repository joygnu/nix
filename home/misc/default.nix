
{  ... }:

{
  home = {
    username = "joy";
    homeDirectory = "/home/joy";
    stateVersion = "23.11";
    sessionVariables = {
    };
  };
 
  programs.home-manager.enable = true;
  
  qt.enable = true; 
  
  xdg.mimeApps.defaultApplications = {
    "text/plain" = ["neovide.desktop"];
    "image/*" = ["imv.desktop"];
    "video/png" = ["mpv.desktop"];
    "video/jpg" = ["mpv.desktop"];
    "video/*" = ["mpv.desktop"];
  };
}
