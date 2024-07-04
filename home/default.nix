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
   inputs.nix-colors.homeManagerModules.default
   inputs.ags.homeManagerModules.default
  ];

 
  home.username = "joy";
    home.homeDirectory = "/home/joy";
    home.stateVersion = "23.11"; 
    programs.home-manager.enable = true;
    home.sessionVariables = {
    EDITOR = "nvim";
  };


  colorScheme = inputs.nix-colors.colorSchemes.gruvbox-dark-medium;

} 
