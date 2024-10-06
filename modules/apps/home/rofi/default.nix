{
  pkgs,
  lib,
  ...
}: {
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
    theme = lib.mkForce "~/nix/modules/apps/home/rofi/gruvbox-material.rasi";
    extraConfig = {
      display-drun = "";
      show-icons = true;
      terminal = "alacritty";
    };
  };
}
