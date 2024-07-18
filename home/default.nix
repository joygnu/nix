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
    inputs.ags.homeManagerModules.default
  ];

} 
