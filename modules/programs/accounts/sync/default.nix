{
  username,
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    sync.enable = lib.mkEnableOption "";
  };

  config = lib.mkIf config.sync.enable {
    systemd.services.sync = {
      description = "Sync Mail and Calendar";
      serviceConfig = {
        Type = "oneshot";
        ExecStart = pkgs.writeShellScript "sync-script" ''
          output=$(${pkgs.isync}/bin/mbsync -a 2>&1)
          new_messages=$(echo "$output" | grep -oP "pulled \K[0-9]+")
          new_messages=''${new_messages:-0}
          echo "$output"
          echo "New messages pulled: $new_messages"
          if [ "$new_messages" -gt 0 ]; then
            DISPLAY=:0 DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus ${pkgs.libnotify}/bin/notify-send "New Mail" "You have $new_messages new mail"
          fi
          ${pkgs.vdirsyncer}/bin/vdirsyncer sync
        '';
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
