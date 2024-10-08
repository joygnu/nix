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

    # environment.gnome.excludePackages = with pkgs; [
    # gnome-backgrounds
    # gnome-bluetooth
    # gnome-color-manager
    # gnome-control-center
    # gnome-shell-extensions
    # gnome-themes-extra
    # gnome-tour
    # gnome-user-docs
    # orca
    # glib
    # gnome-menus
    # gtk3.out
    # xdg-user-dirs
    # baobab
    # epiphany
    # gnome-text-editor
    # gnome-calculator
    # gnome-calendar
    # gnome-characters
    # gnome-clocks
    # gnome-console
    # gnome-contacts
    # gnome-font-viewer
    # gnome-logs
    # gnome-maps
    # gnome-music
    # gnome-system-monitor
    # gnome-weather
    # loupe
    # nautilus
    # gnome-connections
    # simple-scan
    # snapshot
    # totem
    # yelp
    # ];
  };
}
