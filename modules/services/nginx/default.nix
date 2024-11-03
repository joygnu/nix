{
  services.nginx = {
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
