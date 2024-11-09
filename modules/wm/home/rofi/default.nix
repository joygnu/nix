{
  pkgs,
  nixpath,
  ...
}: {
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
    theme = "~/${nixpath}modules/wm/home/rofi/gruvbox-material.rasi";
    extraConfig = {
      display-drun = "";
      show-icons = true;
      terminal = "foot";
    };
  };
}
