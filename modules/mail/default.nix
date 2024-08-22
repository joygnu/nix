{...}:

{
  systemd.services.mw-service = {
    after = [ "network.target" ];
    serviceConfig = {
      User = "joy";
      ExecStart = "/run/current-system/sw/bin/mw -Y";
      Environment = "PATH=/run/current-system/sw/bin:/usr/bin:/bin"; # Ensure all required paths are included
    };
    wantedBy = [ "multi-user.target" ];
  };
  systemd.timers.mw-service-timer = {
    timerConfig = {
      OnBootSec = "5sec";
      OnUnitActiveSec = "10sec";
      AccuracySec = "1sec";
    };
    unitConfig = {
      Wants = [ "mw-service.service" ];
      After = [ "mw-service.service" ];
    };
  };
}

