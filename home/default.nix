{ config, pkgs, inputs, ... }:

{
  colorScheme = inputs.nix-colors.colorSchemes.gruvbox-dark-medium; 
  
  imports = [
    ./waybar
    ./alacritty
    ./hyprland
    ./zsh
    ./rofi
    ./gtk
    inputs.nix-colors.homeManagerModules.default
    ];
  home.username = "joy";
    home.homeDirectory = "/home/joy";
    home.stateVersion = "23.11"; 
    programs.home-manager.enable = true;
    home.sessionVariables = {
    EDITOR = "vim";
  };

  
} 
