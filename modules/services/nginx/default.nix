{
  domain,
  mail,
  lib,
  config,
  ...
}: {
  options = {
    nginx.enable = lib.mkEnableOption "";
  };
  config = lib.mkIf config.nginx.enable {
    services.nginx = {
      virtualHosts."xn--xck.xyz" = {
        forceSSL = true;
        enableACME = true;
        root = "/var/www/www.${domain}";
      };
      virtualHosts."${domain}" = {
        forceSSL = true;
        enableACME = true;
        root = "/var/www/www.${domain}";
      };
      virtualHosts."www.${domain}" = {
        forceSSL = true;
        enableACME = true;
        root = "/var/www/www.${domain}";
      };
      virtualHosts."wallpapers.${domain}" = {
        forceSSL = true;
        enableACME = true;
        root = "/var/www/wallpapers.${domain}";
      };
      virtualHosts."4get.${domain}" = {
        forceSSL = true;
        enableACME = true;
        locations."/".proxyPass = "http://localhost:8080";
      };
      virtualHosts."pin.${domain}" = {
        forceSSL = true;
        enableACME = true;
        locations."/".proxyPass = "http://localhost:6060";
      };
      virtualHosts."trans.${domain}" = {
        forceSSL = true;
        enableACME = true;
        locations."/".proxyPass = "http://localhost:5000";
      };
      virtualHosts."yt.${domain}" = {
        forceSSL = true;
        enableACME = true;
        locations."/".proxyPass = "http://localhost:3000";
      };
    };
    security.acme.defaults.email = "${mail}";
    security.acme.acceptTerms = true;
  };
}
