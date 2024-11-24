{
  lib,
  config,
  ...
}: {
  options = {
    systemd-boot.enable = lib.mkEnableOption "";
  };
  config = lib.mkIf config.systemd-boot.enable {
    boot.loader.systemd-boot.enable = true;
  };
}
