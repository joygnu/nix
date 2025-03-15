{
  domain,
  lib,
  config,
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
      };
    };
    services.immich = {
      enable = true;
      environment.IMMICH_MACHINE_LEARNING_URL = "http://localhost:3003";
    };
    users.users.immich.extraGroups = ["video" "render"];
  };
}
