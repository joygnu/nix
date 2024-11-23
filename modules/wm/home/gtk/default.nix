{
  pkgs,
  config,
  ...
}: let
  gruvboxPlus = import ./gruvbox-plus.nix {inherit pkgs;};
in {
  home.file = {
    ".local/share/icons/GruvboxPlus".source = "${gruvboxPlus}";
  };

  gtk = {
    enable = true;
    iconTheme.package = gruvboxPlus;
    iconTheme.name = "GruvboxPlus";
    gtk2.configLocation = "${config.home.homeDirectory}/.config/gtk-2.0/gtkrc";
  };
}
