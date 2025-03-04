{
  lib,
  config,
  ...
}: {
  options = {
    led.enable = lib.mkEnableOption "";
  };
  config = lib.mkIf config.led.enable {
    systemd.services.micmute = {
      description = "";
      wantedBy = ["multi-user.target"];
      serviceConfig = {
        ExecStart = "/bin/sh -c 'echo 0 | tee /sys/class/leds/platform::micmute/brightness > /dev/null; echo 0 | tee /sys/class/leds/platform::mute/brightness > /dev/null'";
        Type = "oneshot";
        User = "root";
        Group = "root";
      };
    };
  };
}
