{ pkgs, lib, ... }: 
{

  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
    theme = lib.mkForce "~/nix/home/rofi/gruvbox-material.rasi";
    extraConfig = {
      display-ssh =    "";
      display-run =    "";
      display-drun =   "";
      display-window = "";
      display-combi =  "";
      show-icons =    true;
      terminal = "alacritty";
    };
  };
}
