{
  config,
  lib,
  ...
}: let
  homepage-api-keys = {
    immich = config.sops.secrets."homepage-immich-api".path;
    forgejo = config.sops.secrets."homepage-forgejo-api".path;
  };
in {
  options = {
    homepage.enable = lib.mkEnableOption "";
  };

  config = lib.mkIf config.homepage.enable {
    nixpkgs.overlays = [
      (import ./homepage-immich-fix.nix)
    ];
    sops.secrets."homepage-immich-api" = {
      owner = "nobody";
    };
    sops.secrets."homepage-forgejo-api" = {
      owner = "nobody";
    };
    sops.secrets.homepage = {
      owner = "nginx";
      group = "nogroup";
      path = "/run/secrets/homepage-htpasswd";
    };

    services.homepage-dashboard = {
      enable = true;
      openFirewall = true;
      allowedHosts = "home.joygnu.org";
      settings = {
        title = "My Homepage";
        language = "de";
      };
      widgets = [
        {
          resources = {
            cpu = true;
            memory = true;
            disk = "/";
          };
        }
        {
          datetime = {
            text_size = "xl";
            format = {
              dateStyle = "short";
              timeStyle = "short";
              hour12 = false;
            };
          };
        }
      ];
      services = [
        {
          "Netzwerk" = [
            {
              "Syncthing" = {
                description = "Datei-Synchronisation";
                href = "http://sync.joygnu.org";
                icon = "syncthing.svg";
              };
            }
          ];
        }
        {
          "Medien" = [
            {
              "Immich" = {
                description = "Foto & Video Backup";
                href = "https://immich.joygnu.org";
                icon = "immich.svg";
                widget = {
                  type = "immich";
                  url = "https://immich.joygnu.org";
                  key = "{{HOMEPAGE_VAR_IMMICH_API_KEY}}";
                };
              };
            }
          ];
        }
        {
          "Entwicklung" = [
            {
              "Forgejo" = {
                description = "Git Repository";
                href = "https://git.joygnu.org";
                icon = "forgejo.svg";
                widget = {
                  type = "gitea";
                  url = "http://localhost:2000";
                  key = "{{HOMEPAGE_VAR_FORGEJO_API_KEY}}";
                };
              };
            }
          ];
        }
        {
          "Suche" = [
            {
              "SearXNG" = {
                description = "Meta-Suchmaschine";
                href = "https://searx.joygnu.org";
                icon = "searxng.svg";
              };
            }
          ];
        }
        {
          "Kalender & Kontakte" = [
            {
              "Radicale" = {
                description = "CalDAV / CardDAV";
                href = "https://dav.joygnu.org";
                icon = "radicale.svg";
              };
            }
          ];
        }
      ];
      environmentFiles = [homepage-api-keys.immich homepage-api-keys.forgejo];
    };

    services.nginx.virtualHosts."home.joygnu.org" = {
      forceSSL = true;
      enableACME = true;
      locations."/" = {
        proxyPass = "http://127.0.0.1:8082";
        basicAuthFile = config.sops.secrets."homepage".path;
      };
    };
  };
}
