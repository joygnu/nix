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
    ./neomutt
    inputs.ags.homeManagerModules.default
  ];
} 
