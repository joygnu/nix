{domain, ...}: {
  services.nginx = {
    virtualHosts."xn--xck.xyz" = {
      forceSSL = true;
      enableACME = true;
      root = "/var/www/${domain}";
    };
    virtualHosts."${domain}" = {
      forceSSL = true;
      enableACME = true;
      root = "/var/www/www.${domain}";
    };
    virtualHosts."www.${domain}" = {
      forceSSL = true;
      enableACME = true;
      root = "/var/www/${domain}";
    };
    virtualHosts."4get.${domain}" = {
      forceSSL = true;
      enableACME = true;
      locations."/".proxyPass = "http://localhost:8080";
    };
    virtualHosts."pin.${domain}" = {
      forceSSL = true;
      enableACME = true;
      locations."/".proxyPass = "http://localhost:6060";
    };
    virtualHosts."trans.${domain}" = {
      forceSSL = true;
      enableACME = true;
      locations."/".proxyPass = "http://localhost:5000";
    };
    virtualHosts."wallpapers.${domain}" = {
      forceSSL = true;
      enableACME = true;
      root = "/var/www/wallpapers.${domain}";
    };
  };
}
