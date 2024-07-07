{ config, pkgs, inputs, ... }:

{
  imports = [
   ./rofi
   ./alacritty
   ./hyprland
   ./zsh
   ./gtk
   ./git
   ./ags
   inputs.ags.homeManagerModules.default
  ];

  home.username = "joy";
    home.homeDirectory = "/home/joy";
    home.stateVersion = "23.11"; 
    programs.home-manager.enable = true;
    home.sessionVariables = {
    EDITOR = "nvim";
  };
    qt.enable = true;
    qt.style.name = "adwaita";

    xdg.mimeApps.defaultApplications = {
      "text/plain" = ["neovide.desktop"];
      "image/*" = ["imv.desktop"];
      "video/png" = ["mpv.desktop"];
      "video/jpg" = ["mpv.desktop"];
      "video/*" = ["mpv.desktop"];
    };
} 
