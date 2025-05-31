{
  domain,
  lib,
  config,
  pkgs-master,
  ...
}: {
  options = {
    immich.enable = lib.mkEnableOption "";
  };

  config = lib.mkIf config.immich.enable {
    services.nginx = {
      virtualHosts."immich.${domain.a}" = {
        forceSSL = true;
        enableACME = true;
        extraConfig = ''
          client_max_body_size 512M;
          client_body_buffer_size 32k;
        '';
        locations."/".proxyPass = "http://localhost:2283";
        locations."/".extraConfig = ''
              proxy_set_header Host $host;
              proxy_set_header X-Real-IP $remote_addr;
              proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
              proxy_set_header Upgrade $http_upgrade;
              proxy_set_header Connection "Upgrade";
              proxy_http_version 1.1;
                  client_max_body_size 50000M;
          proxy_read_timeout   600s;
          proxy_send_timeout   600s;
          send_timeout         600s;
        '';
      };
    };

    services.immich = {
      enable = true;
      package = pkgs-master.immich;
      environment.IMMICH_MACHINE_LEARNING_URL = "http://localhost:3003";
    };

    users.users.immich.extraGroups = ["video" "render"];
  };
}
