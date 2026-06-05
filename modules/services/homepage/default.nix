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
          "Services" = [
            {
              "Immich" = {
                description = "Photo & Video Backup";
                href = "https://immich.joygnu.org";
                icon = "immich.svg";
                widget = {
                  type = "immich";
                  url = "https://immich.joygnu.org";
                  key = "{{HOMEPAGE_VAR_IMMICH_API_KEY}}";
                };
              };
            }

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

            {
              "Syncthing" = {
                description = "File Synchronization";
                href = "https://sync.joygnu.org";
                icon = "syncthing.svg";
              };
            }

            {
              "Duplicati" = {
                description = "Backup Management";
                href = "https://backup.joygnu.org";
                icon = "duplicati.svg";
              };
            }
          ];
        }

        {
          "Utilities" = [
            {
              "SearXNG" = {
                description = "Meta Search Engine";
                href = "https://searx.joygnu.org";
                icon = "searxng.svg";
              };
            }

            {
              "4get" = {
                description = "Privacy-Friendly Search Frontend";
                href = "https://4get.joygnu.org";
                icon = "mdi-magnify";
              };
            }

            {
              "Binternet" = {
                description = "Privacy-Respecting Image Search";
                href = "https://pin.joygnu.org";
                icon = "mdi-image-search";
              };
            }

            {
              "Mozhi" = {
                description = "Translation Service";
                href = "https://trans.joygnu.org";
                icon = "mdi-translate";
              };
            }

            {
              "Radicale" = {
                description = "CalDAV / CardDAV";
                href = "https://dav.joygnu.org";
                icon = "radicale.svg";
              };
            }
          ];
        }

        {
          "Infrastructure" = [
            {
              "Gatus" = {
                description = "Service Monitoring";
                href = "https://status.joygnu.org";
                icon = "gatus";
              };
            }

            {
              "ntfy" = {
                description = "Push Notifications";
                href = "https://ntfy.joygnu.org";
                icon = "ntfy.svg";
              };
            }
          ];
        }

        {
          "Web" = [
            {
              "Website" = {
                description = "Personal Website";
                href = "https://joygnu.org";
                icon = "mdi-web";
              };
            }

            {
              "Mail" = {
                description = "Mail Server";
                href = "https://mail.joygnu.org";
                icon = "mdi-email";
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
