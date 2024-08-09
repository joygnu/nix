{ inputs, ... }:

{

  imports = [
    ./zsh
    ./gtk
    ./git
    ./ags
    ./misc
    ./rofi
    ./helix
    ./firefox
    ./alacritty
    ./hyprland
    ./swaylock
    inputs.ags.homeManagerModules.default
  ];
} 
