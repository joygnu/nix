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
    ./hyprlock
    ./neomutt
    ./newsboat
    inputs.ags.homeManagerModules.default
  ];
} 
