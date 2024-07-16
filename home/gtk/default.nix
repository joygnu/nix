{ pkgs, ... }: 
let
  gruvboxPlus = import ./gruvbox-plus.nix {inherit pkgs;};
in 

{
  home.file = {
    ".local/share/icons/GruvboxPlus".source = "${gruvboxPlus}";
  };

  qt.enable = true;
  qt.style.name = "adwaita-dark";

  gtk.enable = true;
  gtk.iconTheme.package = gruvboxPlus;
  gtk.iconTheme.name = "GruvboxPlus";
}
