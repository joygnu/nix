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
        accounts.ibz = {
          name = "ibz";
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
            url = "https://dav.${domain.a}/${username}/f532fc7f-9c0b-cc70-5b53-052c1734730e/";
            userName = username;
            passwordCommand = ["cat" "/run/secrets/calendar"];
          };
        };
      };
    };
    sops.secrets.calendar = {
      owner = username;
    };
  };
}
