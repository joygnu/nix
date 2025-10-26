{
  domain,
  lib,
  config,
  pkgs,
  ...
}: let
  cfg = config.services.forgejo;
  srv = cfg.settings.server;

  theme = pkgs.fetchurl {
    url = "https://git.sainnhe.dev/sainnhe/gitea-themes/raw/branch/master/dist/theme-gruvbox-dark.css";
    hash = "sha256-aZyGBFav3Pl1TqHIJvzxduyozZnPRI5XsUlNsa1d6E8=";
  };
in {
  options = {
    forgejo.enable = lib.mkEnableOption "";
  };

  config = lib.mkIf config.forgejo.enable {
    services.nginx = {
      virtualHosts.${cfg.settings.server.DOMAIN} = {
        forceSSL = true;
        enableACME = true;
        extraConfig = ''
          client_max_body_size 512M;
        '';
        locations."/".proxyPass = "http://localhost:${toString srv.HTTP_PORT}";
      };
    };

    services.forgejo = {
      enable = true;
      package = pkgs.forgejo;
      # lfs.enable = true;

      settings = {
        ui = {
          DEFAULT_THEME = "gruvbox-dark";
          THEMES = "auto,gitea,arc-green,gruvbox-dark";
        };
        server = {
          DOMAIN = "git.${domain.a}";
          ROOT_URL = "https://${srv.DOMAIN}/";
          HTTP_PORT = 2000;
        };
        service.DISABLE_REGISTRATION = true;
      };
    };

    systemd.services.forgejo = {
      preStart = ''
        rm -fr ${config.services.forgejo.customDir}/public/assets/css/
        mkdir -p ${config.services.forgejo.customDir}/public/assets/css/
        ln -sf ${theme} ${config.services.forgejo.customDir}/public/assets/css/theme-gruvbox-dark.css
      '';
    };
  };
}
