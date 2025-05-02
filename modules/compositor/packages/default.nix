{
  pkgs,
  config,
  lib,
  ...
}: {
  environment.systemPackages = with pkgs;
    lib.mkIf (config.hyprland.enable || config.gnome.enable) [
      signal-desktop-bin
      keepassxc
      bottles
      ferdium
      transmission_4-gtk
      sqlitebrowser
      libreoffice-qt
      authenticator
    ];
}
