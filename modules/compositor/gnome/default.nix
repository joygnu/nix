{
  config,
  lib,
  pkgs,
  username,
  ...
}: {
  options = {
    gnome.enable = lib.mkEnableOption "";
  };

  config = lib.mkIf config.gnome.enable {
    services.desktopManager.gnome.enable = true;

    environment.systemPackages = with pkgs; [
      gnomeExtensions.appindicator
    ];

    services.udev.packages = [pkgs.gnome-settings-daemon];

    home-manager.users.${username} = {
      dconf.settings = {
        "org/gnome/desktop/input-sources" = {
          xkb-options = ["caps:swapescape"];
        };

        "org/gnome/shell" = {
          enabled-extensions = [(pkgs.gnomeExtensions.appindicator).extensionUuid];
        };
      };
    };
  };
}
