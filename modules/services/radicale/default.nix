{domain, ...}: {
  services.radicale = {
    enable = true;
    settings = {
      server.hosts = ["0.0.0.0:5232"];
      auth = {
        type = "htpasswd";
        htpasswd_filename = "/run/secrets/radicale";
        htpasswd_encryption = "plain";
      };
    };
  };
  services.nginx = {
    virtualHosts."dav.${domain.a}" = {
      forceSSL = true;
      enableACME = true;
      locations."/".proxyPass = "http://localhost:5232";
    };
  };
}
