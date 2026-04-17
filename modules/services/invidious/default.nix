{
  domain,
  lib,
  config,
  ...
}: {
  options = {
    invidious.enable = lib.mkEnableOption "";
  };

  config = lib.mkIf config.invidious.enable {
    services.invidious = {
      enable = true;
      sig-helper.enable = false;
      domain = "yt.${domain.a}";
      nginx.enable = true;
      port = 1939;
      database.createLocally = true;
      settings = {
        invidious_companion = [
          {
            private_url = "http://localhost:8282/companion";
          }
        ];
        invidious_companion_key = "XXXXXXXXXXXXXXXX";
        db = {
          user = "invidious";
          dbname = "invidious";
        };
        statistics_enabled = true;
        popular_enabled = false;
        default_user_preferences = {
          default_home = "<none>";
          quality = "dash";
          feed_menu = ["Subscriptions" "Playlists"];
        };
      };
    };
    virtualisation.oci-containers = {
      backend = "docker";
      containers = {
        invidious-companion = {
          image = "quay.io/invidious/invidious-companion:latest";
          ports = ["127.0.0.1:8282:8282"];
          volumes = [
            "companioncache:/var/tmp/youtubei.js:rw"
          ];
          environment = {
            SERVER_SECRET_KEY = "XXXXXXXXXXXXXXXX";
          };
        };
      };
    };
  };
}
