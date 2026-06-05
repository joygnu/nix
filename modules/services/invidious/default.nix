{
  domain,
  lib,
  config,
  ...
}: {
  options.invidious.enable = lib.mkEnableOption "";

  config = lib.mkIf config.invidious.enable {
    nixpkgs.overlays = [
      (final: prev: {
        invidious = prev.invidious.overrideAttrs {
          src = prev.fetchFromGitHub {
            owner = "iv-org";
            repo = "invidious";
            rev = "99390d0";
            fetchSubmodules = true;
            hash = "sha256-1SHrdt5wipRi24oML0UGYUBN/HSaWJj+ysslM4OSCKw=";
          };
        };
      })
    ];
    services.invidious = {
      enable = true;
      sig-helper.enable = false;
      domain = "yt.${domain.a}";
      nginx.enable = true;
      port = 1939;
      database.createLocally = true;
      settings = {
        invidious_companion = [{private_url = "http://localhost:8282/companion";}];
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

    services.anubis.instances.invidious.settings = {
      BIND = "127.0.0.1:8923";
      BIND_NETWORK = "tcp";
      UPSTREAM = "http://localhost:1939";
      TARGET = "http://localhost:1939";
      DIFFICULTY = 512;
    };

    services.nginx.virtualHosts."yt.${domain.a}" = lib.mkForce {
      enableACME = true;
      forceSSL = true;
      locations."/" = {
        proxyPass = "http://127.0.0.1:8923";
        recommendedProxySettings = false;
        extraConfig = ''
          proxy_http_version 1.1;
          proxy_set_header Host $host;
          proxy_set_header X-Real-IP $remote_addr;
          proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
          proxy_set_header X-Forwarded-Proto $scheme;
          proxy_set_header Connection "";
        '';
      };
    };

    virtualisation.oci-containers.backend = "docker";
    virtualisation.oci-containers.containers.invidious-companion = {
      image = "quay.io/invidious/invidious-companion:latest";
      ports = ["127.0.0.1:8282:8282"];
      volumes = ["companioncache:/var/tmp/youtubei.js:rw"];
      environment.SERVER_SECRET_KEY = "XXXXXXXXXXXXXXXX";
    };
  };
}
