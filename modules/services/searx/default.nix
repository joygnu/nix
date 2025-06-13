{
  domain,
  lib,
  config,
  ...
}: {
  options = {
    searx.enable = lib.mkEnableOption "";
  };

  config = lib.mkIf config.searx.enable {
    services.searx = {
      enable = true;
      settings = {
        general = {
          debug = false;
        };
        server = {
          bind_address = "127.0.0.1";
          port = 8888;
          secret_key = "/run/secrets/searx";
        };
        search = {
          favicon_resolver = "duckduckgo";
        };
      };
    };
    services.nginx = {
      virtualHosts."searx.${domain.a}" = {
        forceSSL = true;
        enableACME = true;
        locations."/".proxyPass = "http://localhost:8888";
      };
    };
  };
}
