{ pkgs, ... }: 
let
  gruvboxPlus = import ./gruvbox-plus.nix {inherit pkgs;};
in 

{
  home.file = {
    ".local/share/icons/GruvboxPlus".source = "${gruvboxPlus}";
  };

  gtk.enable = true;
  gtk.iconTheme.package = gruvboxPlus;
  gtk.iconTheme.name = "GruvboxPlus";

  qt.enable = true;
  qt.style.name = "adwaita-dark";
  qt.style.package = pkgs.adwaita-qt;
  qt.platformTheme.name = "adwaita";
}
