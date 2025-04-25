{
  domain,
  lib,
  config,
  ...
}: {
  options = {
    redlib.enable = lib.mkEnableOption "";
  };

  config = lib.mkIf config.redlib.enable {
    services.redlib = {
      enable = true;
      port = 7070;
    };

    services.nginx = {
      virtualHosts."red.${domain.a}" = {
        forceSSL = true;
        enableACME = true;
        extraConfig = ''
          client_max_body_size 512M;
          client_body_buffer_size 32k;
        '';

        locations."/" = {
          proxyPass = "http://localhost:7070";
        };

        locations."= /robots.txt" = {
          extraConfig = ''
            add_header Content-Type text/plain;
            return 200 "User-agent: *\nDisallow: /\n";
            access_log off;
          '';
        };
      };
    };
  };
}
