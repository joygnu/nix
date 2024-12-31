{
  pkgs,
  pkgs-stable,
  config,
  lib,
  ...
}: {
  config = lib.mkIf config.hyprland.enable {
    environment.systemPackages = with pkgs; [
      pwvucontrol
      pulseaudioFull
      sent
      imv
      signal-desktop
      keepassxc
      vesktop
      pkgs-stable.bottles
      boxbuddy
      ferdium
      obs-studio
      transmission_4-gtk
      gnome-clocks
      gnome-calculator
      gnome-disk-utility
      gnome-sound-recorder
      kdePackages.kdenlive
      sqlitebrowser
    ];
  };
}
