{
  domain,
  config,
  lib,
  ...
}: {
  config = lib.mkIf config.nginx.enable {
    virtualisation.oci-containers.containers = {
      hackagecompare = {
        image = "ghcr.io/ahwxorg/binternet:latest";
        ports = ["8008:8080"];
      };
    };
    services.nginx = {
      virtualHosts."pin.${domain.a}" = {
        forceSSL = true;
        enableACME = true;
        locations."/".proxyPass = "http://localhost:8008";
      };
    };
  };
}
