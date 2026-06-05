{
  config,
  lib,
  ...
}: {
  options = {
    duplicati.enable = lib.mkEnableOption "";
  };

  config = lib.mkIf config.duplicati.enable {
    services.duplicati = {
      enable = true;
      port = 8200;
      interface = "127.0.0.1";
      user = "root";
      parameters = "--webservice-allowedhostnames=backup.joygnu.org";
    };

    services.nginx.virtualHosts."backup.joygnu.org" = {
      forceSSL = true;
      enableACME = true;
      locations."/" = {
        proxyPass = "http://127.0.0.1:8200";
        proxyWebsockets = true;
      };
    };
  };
}
