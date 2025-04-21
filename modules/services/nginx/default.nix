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
        root = "/var/www/www.${domain.a}";
      };
      virtualHosts."${domain.a}" = {
        forceSSL = true;
        enableACME = true;
        root = "/var/www/www.${domain.a}";
      };
      virtualHosts."www.${domain.a}" = {
        forceSSL = true;
        enableACME = true;
        root = "/var/www/www.${domain.a}";
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
      virtualHosts."yt.${domain.a}" = {
        forceSSL = true;
        enableACME = true;
        locations."/".proxyPass = "http://localhost:3000";
      };
    };
    security.acme.defaults.email = "${mail.a}@${domain.a}";
    security.acme.acceptTerms = true;
  };
}
