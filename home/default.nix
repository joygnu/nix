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

    programs.neovim.enable = true;

  xdg.configFile."nvim".source = pkgs.stdenv.mkDerivation {
    name = "NvChad";
    src = pkgs.fetchFromGitHub {
      owner = "NvChad";
      repo = "NvChad";
      rev = "f17e83010f25784b58dea175c6480b3a8225a3e9";
      hash = "sha256-P5TRjg603/7kOVNFC8nXfyciNRLsIeFvKsoRCIwFP3I=";
    };
    installPhase = ''
    mkdir -p $out
    cp -r ./* $out/
    cd $out/
     cp -r ${./my_nvchad_config} $out/lua/custom
    '';
  };
  
  home.username = "joy";
    home.homeDirectory = "/home/joy";
    home.stateVersion = "23.11"; 
    programs.home-manager.enable = true;
    home.sessionVariables = {
    EDITOR = "nvim";
  };


  colorScheme = inputs.nix-colors.colorSchemes.gruvbox-dark-medium;

} 
