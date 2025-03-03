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
      virtualHosts."immich.${domain}" = {
        forceSSL = true;
        enableACME = true;
        extraConfig = ''
          client_max_body_size 512M;
          client_body_buffer_size 32k;
        '';
        locations."/".proxyPass = "http://localhost:2283";
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
