{ pkgs, config, lib, ... }: 
{

    programs.rofi = {
      enable = true;
      package = pkgs.rofi-wayland;
      theme = "~/nix/home/rofi/gruvbox-material.rasi";
      extraConfig = {
        modi = "drun";
        icon-theme = "Oranchelo";
        show-icons = true;
        terminal = "alacritty";
        drun-display-format = "{icon} {name}";
        location = 1;
        disable-history = false;
        hide-scrollbar = true;
        display-drun = "   Apps ";
        display-network = " 󰤨  Network";
        sidebar-mode = false;
      };
};
}
