{
  services.nginx = {
    virtualHosts."immich.joygnu.org" = {
      forceSSL = true;
      enableACME = true;
      extraConfig = ''
        client_max_body_size 512M;
      '';
      locations."/".proxyPass = "http://localhost:2283";
    };
  };
  services.immich = {
    enable = true;
    environment.IMMICH_MACHINE_LEARNING_URL = "http://localhost:3003";
  };
  users.users.immich.extraGroups = ["video" "render"];
}