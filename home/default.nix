{ config, pkgs, inputs, ... }:

{
  colorScheme = inputs.nix-colors.colorSchemes.gruvbox-dark-medium;
  imports = [
    ./rofi
    ./waybar
    ./alacritty
    ./hyprland
    ./zsh
    ./gtk
    ./git
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
