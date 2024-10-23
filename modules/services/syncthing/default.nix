{
  services.syncthing = {
    enable = true;
    dataDir = "/home/joy";
    openDefaultPorts = true;
    configDir = "/home/joy/.config/syncthing";
    user = "joy";
    group = "users";
    guiAddress = "0.0.0.0:8384";
  };
  services.nginx = {
    enable = true;
    recommendedProxySettings = true;
    recommendedTlsSettings = true;
    virtualHosts."sync.joygnu.org" = {
      enableACME = true;
      forceSSL = true;
      locations."/" = {
        proxyPass = "http://127.0.0.1:8384";
        proxyWebsockets = true;
        extraConfig =
          "proxy_ssl_server_name on;"
          + "proxy_pass_header Authorization;";
      };
    };
  };
}
