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
    EDITOR = "vim";
  };

programs.neovim = {
  enable = true;
  extraConfig = ''
    set number relativenumber
  '';
};


programs.neovim.plugins = [
  pkgs.vimPlugins.nvim-tree-lua
  {
    plugin = pkgs.vimPlugins.vim-startify;
    config = "let g:startify_change_to_vcs_root = 0";
  }
];


  colorScheme = inputs.nix-colors.colorSchemes.gruvbox-dark-medium;

} 
