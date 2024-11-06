{
  services.nginx = {
    virtualHosts."xn--xck.xyz" = {
      forceSSL = true;
      enableACME = true;
      root = "/var/www/www.joygnu.org";
    };
    virtualHosts."joygnu.org" = {
      forceSSL = true;
      enableACME = true;
      root = "/var/www/www.joygnu.org";
    };
    virtualHosts."www.joygnu.org" = {
      forceSSL = true;
      enableACME = true;
      root = "/var/www/www.joygnu.org";
    };
    virtualHosts."4get.joygnu.org" = {
      forceSSL = true;
      enableACME = true;
      locations."/".proxyPass = "http://localhost:8080";
    };
    virtualHosts."pin.joygnu.org" = {
      forceSSL = true;
      enableACME = true;
      locations."/".proxyPass = "http://localhost:6060";
    };
    virtualHosts."trans.joygnu.org" = {
      forceSSL = true;
      enableACME = true;
      locations."/".proxyPass = "http://localhost:5000";
    };
    virtualHosts."wallpapers.joygnu.org" = {
      forceSSL = true;
      enableACME = true;
      root = "/var/www/wallpapers.joygnu.org";
    };
  };
  security.acme.certs = {
    "www.joygnu.org".email = "contact@joygnu.org";
  };
}
