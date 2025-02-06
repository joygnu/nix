{
  pkgs,
  config,
  lib,
  ...
}: {
  config = lib.mkIf config.hyprland.enable {
    environment.systemPackages = with pkgs; [
      pwvucontrol
      sent
      imv
      signal-desktop
      keepassxc
      vesktop
      bottles
      boxbuddy
      ferdium
      transmission_4-gtk
      gnome-clocks
      gnome-calculator
      gnome-disk-utility
      gnome-sound-recorder
      sqlitebrowser
      libreoffice-qt
      kdePackages.kdenlive
    ];
  };
}
