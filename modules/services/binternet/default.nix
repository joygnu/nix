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
        ports = ["127.0.0.1:8009:8080"];
      };
    };
    services.nginx = {
      virtualHosts."pin.${domain.a}" = {
        forceSSL = true;
        enableACME = true;
        locations."/".proxyPass = "http://localhost:8009";
      };
    };
  };
}
