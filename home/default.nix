{ inputs, ... }:

{

  imports = [
    ./rofi
    ./firefox
    ./alacritty
    ./hyprland
    ./zsh
    ./gtk
    ./git
    ./ags
    ./helix
    ./misc
    inputs.ags.homeManagerModules.default
    inputs.nixvim.homeManagerModules.nixvim   
  ];

} 
