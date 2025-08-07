{
  domain,
  username,
  config,
  lib,
  ...
}: {
  options = {
    calendar.enable = lib.mkEnableOption "";
  };
  config = lib.mkIf config.calendar.enable {
    sops.secrets.calendar = {
      owner = username;
    };
    home-manager.users.${username} = {
      programs.khal = {
        enable = true;
        settings = {
          default.timedelta = "7d";
          view.agenda_event_format = "{calendar-color}{cancelled}{start-end-time-style} {title}{repeat-symbol}{reset}";
        };
      };

      programs.vdirsyncer.enable = true;

      accounts.calendar = {
        basePath = ".local/share/calendar";
        accounts.calendar = {
          name = "calendar";
          primaryCollection = "calendar";
          primary = true;
          khal = {
            enable = true;
            type = "calendar";
            color = "light blue";
          };
          vdirsyncer = {
            enable = true;
          };
          remote = {
            type = "caldav";
            url = "https://dav.${domain.a}/${username}/a0abc0e3-5664-3aef-22aa-da6dbfee7ffe/";
            userName = username;
            passwordCommand = ["cat" "/run/secrets/calendar"];
          };
        };
        accounts.ipso = {
          name = "ipso";
          khal = {
            enable = true;
            type = "calendar";
            color = "light blue";
          };
          vdirsyncer = {
            enable = true;
          };
          remote = {
            type = "caldav";
            url = "https://dav.${domain.a}/${username}/ipso/";
            userName = username;
            passwordCommand = ["cat" "/run/secrets/calendar"];
          };
        };
      };
    };
  };
}
