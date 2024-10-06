{
  config,
  lib,
  pkgs,
  ...
}: {
  options = {
    gnome.enable = lib.mkEnableOption "";
  };

  config = lib.mkIf config.gnome.enable {
    services.xserver.desktopManager.gnome.enable = true;

    environment.gnome.excludePackages = with pkgs; [
      adwaita-icon-theme
      # nixos-background-info This can't be excluded since it's defined locally. So even if we removed all GNOME backgrounds it seems we have to keep the NixOS one.
      gnome-backgrounds
      gnome-bluetooth
      gnome-color-manager
      gnome-control-center
      gnome-shell-extensions
      gnome-themes-extra
      pkgs.gnome-tour # GNOME Shell detects the .desktop file on first log-in.
      pkgs.gnome-user-docs
      pkgs.orca
      pkgs.glib # for gsettings program
      pkgs.gnome-menus
      pkgs.gtk3.out # for gtk-launch program
      pkgs.xdg-user-dirs # Update user dirs as described in https://freedesktop.org/wiki/Software/xdg-user-dirs/
      baobab
      epiphany
      pkgs.gnome-text-editor
      gnome-calculator
      gnome-calendar
      gnome-characters
      gnome-clocks
      pkgs.gnome-console
      gnome-contacts
      gnome-font-viewer
      gnome-logs
      gnome-maps
      gnome-music
      gnome-system-monitor
      gnome-weather
      pkgs.loupe
      nautilus
      pkgs.gnome-connections
      simple-scan
      pkgs.snapshot
      totem
      yelp
    ];
  };
}
