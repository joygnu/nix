{pkgs, ...}: {
  home-manager.users.joy.qt = {
    enable = true;
    style.name = "adwaita-dark";
    style.package = pkgs.adwaita-qt;
    platformTheme.name = "adwaita";
  };
}