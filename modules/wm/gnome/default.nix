{
  config,
  lib,
  ...
}: {
  options = {
    gnome.enable = lib.mkEnableOption "";
  };
  config = lib.mkIf config.gnome.enable {
    services.xserver.desktopManager.gnome.enable = true;
  };
}
