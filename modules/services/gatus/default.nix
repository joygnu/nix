{
  config,
  lib,
  ...
}: {
  options = {
    gatus.enable = lib.mkEnableOption "Gatus Status Page and Secured Self-Hosted ntfy via sops-nix";
  };

  config = lib.mkIf config.gatus.enable {
    sops.secrets = {
      "ntfy" = {};
    };

    services.ntfy-sh = {
      enable = true;
      settings = {
        base-url = "https://joygnu.org";
        listen-http = "127.0.0.1:2586";
        behind-proxy = true;
        enable-login = false;
        auth-default-access = "read-write";
      };
    };

    services.gatus = {
      enable = true;
      settings = {
        web = {
          port = 8383;
        };
        alerting = {
          ntfy = {
            url = "https://ntfy.joygnu.org";
            topic = "gatus-alerts";
            priority = 4;
          };
        };
        endpoints = [
          {
            name = "Immich";
            group = "Services";
            url = "https://immich.joygnu.org";
            interval = "5m";
            conditions = ["[STATUS] == 200"];
            alerts = [
              {
                type = "ntfy";
                failure-threshold = 1;
                send-on-resolved = true;
              }
            ];
          }
          {
            name = "Forgejo";
            group = "Services";
            url = "https://git.joygnu.org";
            interval = "5m";
            conditions = ["[STATUS] == 200"];
            alerts = [
              {
                type = "ntfy";
                failure-threshold = 1;
                send-on-resolved = true;
              }
            ];
          }
          {
            name = "SearXNG";
            group = "Services";
            url = "https://searx.joygnu.org";
            interval = "5m";
            conditions = ["[STATUS] == 200"];
            alerts = [
              {
                type = "ntfy";
                failure-threshold = 1;
                send-on-resolved = true;
              }
            ];
          }
          {
            name = "Syncthing";
            group = "Services";
            url = "https://sync.joygnu.org";
            interval = "5m";
            conditions = ["[STATUS] == 200"];
            alerts = [
              {
                type = "ntfy";
                failure-threshold = 1;
                send-on-resolved = true;
              }
            ];
          }
          {
            name = "Radicale";
            group = "Services";
            url = "https://dav.joygnu.org";
            interval = "5m";
            conditions = ["[STATUS] == 200"];
            alerts = [
              {
                type = "ntfy";
                failure-threshold = 1;
                send-on-resolved = true;
              }
            ];
          }
        ];
      };
    };

    services.nginx.virtualHosts = {
      "status.joygnu.org" = {
        forceSSL = true;
        enableACME = true;
        locations."/" = {
          proxyPass = "http://127.0.0.1:8383";
        };
      };
      "ntfy.joygnu.org" = {
        forceSSL = true;
        enableACME = true;
        locations."/" = {
          proxyPass = "http://127.0.0.1:2586";
          proxyWebsockets = true;
        };
      };
    };
  };
}
