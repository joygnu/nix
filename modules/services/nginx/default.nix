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
      virtualHosts."${domain.b}" = {
        forceSSL = true;
        enableACME = true;
        root = "/var/www/website";
      };
      virtualHosts."${domain.a}" = {
        forceSSL = true;
        enableACME = true;
        root = "/var/www/website";
      };
      virtualHosts."www.${domain.a}" = {
        forceSSL = true;
        enableACME = true;
        root = "/var/www/website";
      };
      virtualHosts."pin.${domain.a}" = {
        forceSSL = true;
        enableACME = true;
        locations."/".proxyPass = "http://localhost:8009";
      };
      virtualHosts."trans.${domain.a}" = {
        forceSSL = true;
        enableACME = true;
        locations."/".proxyPass = "http://localhost:5000";
      };
    };
    security.acme.defaults.email = "${mail.a}@${domain.a}";
    security.acme.acceptTerms = true;
  };
}
