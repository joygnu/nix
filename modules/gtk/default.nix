{pkgs, ...}: let
  gruvboxPlus = import ./gruvbox-plus.nix {inherit pkgs;};
in {
  home-manager.users.joy.home.file = {
    ".local/share/icons/GruvboxPlus".source = "${gruvboxPlus}";
  };

  home-manager.users.joy.gtk = {
    enable = true;
    iconTheme.package = gruvboxPlus;
    iconTheme.name = "GruvboxPlus";
  };
  
  # qt.enable = true;
  # qt.style.name = "adwaita-dark";
  # qt.style.package = pkgs.adwaita-qt;
  # qt.platformTheme.name = "adwaita";
}
