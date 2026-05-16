{
  pkgs,
  config,
  lib,
  ...
}: {
  environment.systemPackages = with pkgs;
    lib.mkIf (config.hyprland.enable || config.gnome.enable) [
      signal-desktop
      keepassxc
      ferdium
      transmission_4-gtk
      libreoffice-qt
      authenticator
      drawio
      audacity
      chatterino7
      chromium
    ];
}
