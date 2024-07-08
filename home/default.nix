{ inputs, ... }:

{
  imports = [
    ./rofi
    ./alacritty
    ./hyprland
    ./zsh
    ./gtk
    ./git
    ./ags
    ./neovim
    ./misc
    inputs.ags.homeManagerModules.default
    inputs.nixvim.homeManagerModules.nixvim   
  ];

} 
