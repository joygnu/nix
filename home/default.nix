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
    ./hypridle
    inputs.ags.homeManagerModules.default
  ];
} 
