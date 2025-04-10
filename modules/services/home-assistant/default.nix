{
  config,
  lib,
  ...
}: {
  options = {
    home-assistant.enable = lib.mkEnableOption "";
  };
  config = lib.mkIf config.home-assistant.enable {
    services.home-assistant = {
      enable = true;
      extraComponents = [
        "esphome"
        "met"
        "radio_browser"
      ];
      config = {
        default_config = {};
      };
    };

    services.home-assistant.config.http = {
      server_host = "::1";
      trusted_proxies = ["::1"];
      use_x_forwarded_for = true;
    };

    services.nginx = {
      enable = true;
      recommendedProxySettings = true;
      virtualHosts."home.joygnu.org" = {
        forceSSL = true;
        enableACME = true;
        extraConfig = ''
          proxy_buffering off;
        '';
        locations."/" = {
          proxyPass = "http://[::1]:8123";
          proxyWebsockets = true;
        };
      };
    };
  };
}
