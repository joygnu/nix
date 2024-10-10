{
  pkgs,
  lib,
  ...
}: {
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
    theme = lib.mkForce "~/nix/modules/programs/home/rofi/gruvbox-material.rasi";
    extraConfig = {
      display-drun = "";
      show-icons = true;
      terminal = "alacritty";
    };
  };
}
