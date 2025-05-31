{
  domain,
  mail,
  lib,
  config,
  pkgs,
  ...
}: {
  config = lib.mkIf config.nginx.enable {
    services.nginx = {
      virtualHosts."4get.${domain.a}" = {
        forceSSL = true;
        enableACME = true;
        root = "/var/www/4get";

        locations."@php" = {
          extraConfig = ''
            fastcgi_pass  unix:${config.services.phpfpm.pools.mypool.socket};
            fastcgi_index index.php;
            try_files $uri.php $uri/index.php =404;
            include ${config.services.nginx.package}/conf/fastcgi.conf;
            fastcgi_intercept_errors on;
          '';
        };

        locations."/" = {
          tryFiles = "$uri @php";
        };
        locations. "~* ^([a-zA-Z0-9_\\-./]+)\.php$" = {
          return = "301 $1";
        };
      };
    };
    services.phpfpm = {
      phpPackage = pkgs.php.buildEnv {
        extensions = {
          enabled,
          all,
        }:
          enabled
          ++ (with all; [
            apcu
            curl
            mbstring
            imagick
          ]);
      };
      pools.mypool = {
        user = "nobody";
        settings = {
          "pm" = "dynamic";
          "listen.owner" = config.services.nginx.user;
          "pm.max_children" = 5;
          "pm.start_servers" = 1;
          "pm.min_spare_servers" = 1;
          "pm.max_spare_servers" = 1;
          "pm.max_requests" = 500;
        };
      };
    };

    security.acme.defaults.email = "${mail.a}@${domain.a}";
    security.acme.acceptTerms = true;
  };
}
