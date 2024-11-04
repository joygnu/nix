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
  };
  security.acme.certs = {
    "www.joygnu.org".email = "contact@joygnu.org";
  };
}
