{config, ...}: let
  cfg = config.services.forgejo;
  srv = cfg.settings.server;
in {
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
    # user = "git";
    settings = {
      server = {
        DOMAIN = "git.joygnu.org";
        ROOT_URL = "https://${srv.DOMAIN}/";
        HTTP_PORT = 2000;
      };
      service.DISABLE_REGISTRATION = true;
    };
  };
}
