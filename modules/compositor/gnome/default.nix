{
  config,
  lib,
  ...
}: {
  options = {
    gnome.enable = lib.mkEnableOption "";
  };
  config = lib.mkIf config.gnome.enable {
    services.desktopManager.gnome.enable = true;
  };
}
