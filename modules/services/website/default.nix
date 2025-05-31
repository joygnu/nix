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
    };
    security.acme.defaults.email = "${mail.a}@${domain.a}";
    security.acme.acceptTerms = true;
    networking.firewall.allowedTCPPorts = [80 443];
  };
}
