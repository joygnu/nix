{
  domain,
  config,
  lib,
  ...
}: {
  config = lib.mkIf config.nginx.enable {
    virtualisation.oci-containers.containers = {
      mozhi = {
        image = "codeberg.org/aryak/mozhi:latest";
        ports = ["3000:3000"];
      };
    };
    services.nginx = {
      virtualHosts."trans.${domain.a}" = {
        forceSSL = true;
        enableACME = true;
        locations."/".proxyPass = "http://localhost:3000";
      };
    };
  };
}
