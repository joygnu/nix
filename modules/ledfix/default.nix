{ ... }:
{
  systemd.services.micmute = {
    description = "Set microphone mute LED to off";
    wantedBy = [ "multi-user.target" ];
    serviceConfig = {
      ExecStart = "sh -c 'echo 0 | tee /sys/class/leds/thinkpad::micmute/brightness'";
      Type = "oneshot";
    };
  };
}
