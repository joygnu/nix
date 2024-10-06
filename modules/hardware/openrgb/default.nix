{
  config,
  lib,
  ...
}: {
  options = {
    openrgb.enable = lib.mkEnableOption "";
  };

  config = lib.mkIf config.openrgb.enable {
    services.hardware.openrgb.enable = true;
  };
}
