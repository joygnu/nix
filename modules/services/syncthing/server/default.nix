{
  username,
  domain,
  lib,
  config,
  ...
}: {
  options = {
    sync-server.enable = lib.mkEnableOption "";
  };
  config = lib.mkIf config.sync-server.enable {
    services.syncthing = {
      enable = true;
      dataDir = "/home/${username}";
      openDefaultPorts = true;
      configDir = "/home/${username}/.config/syncthing";
      user = username;
      group = "users";
      guiAddress = "0.0.0.0:8384";
    };
    services.nginx = {
      enable = true;
      recommendedProxySettings = true;
      recommendedTlsSettings = true;
      virtualHosts."sync.${domain}" = {
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
  };
}
