{
  username,
  pkgs,
  lib,
  config,
  ...
}: {
  config = lib.mkIf config.neomutt.enable {
    systemd.services.mail-sync = {
      description = "";
      serviceConfig = {
        Type = "simple";
        ExecStart = "${pkgs.bash}/bin/bash -c 'output=$(${pkgs.isync}/bin/mbsync -a 2>&1); echo \"$output\"; if echo \"$output\" | grep -q \"pulled [1-9]\\+ new message(s)\"; then DISPLAY=:0 DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus ${pkgs.libnotify}/bin/notify-send \"New Mail\" \"You have new mail!\"; fi'";
        User = username;
        Environment = [
          "DISPLAY=:0"
          "DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus"
        ];
      };
      startAt = "*:0/1";
      wantedBy = ["multi-user.target"];
    };
  };
}
