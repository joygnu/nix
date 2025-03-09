{
  domain,
  lib,
  config,
  ...
}: let
  cfg = config.services.forgejo;
  srv = cfg.settings.server;
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
      lfs.enable = true;
      settings = {
        server = {
          DOMAIN = "git.${domain.a}";
          ROOT_URL = "https://${srv.DOMAIN}/";
          HTTP_PORT = 2000;
        };
        service.DISABLE_REGISTRATION = true;
      };
    };
  };
}
