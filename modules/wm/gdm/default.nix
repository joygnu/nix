{
  username,
  lib,
  config,
  ...
}: {
  options = {
    gdm.enable = lib.mkEnableOption "";
  };
  config = lib.mkIf config.gdm.enable {
    services.xserver.enable = true;
    services.xserver.displayManager.gdm.enable = true;

    services.displayManager.autoLogin.enable = true;
    services.displayManager.autoLogin.user = username;

    systemd.services."getty@tty1".enable = false;
    systemd.services."autovt@tty1".enable = false;
  };
}
