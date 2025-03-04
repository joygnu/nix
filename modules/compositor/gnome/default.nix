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
    services.devmon.enable = true;
    services.udisks2.enable = true;
    services.printing.enable = true;
    services.gvfs.enable = true;
  };
}
