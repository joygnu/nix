{
  services.invidious = {
    enable = true;
    settings = {
      db = {
        user = "invidious";
        dbname = "invidious";
      };
    };
  };
  services.invidious.domain = "yt.joygnu.org";
  services.invidious.nginx.enable = true;
  security.acme.defaults.email = "contact@joygnu.org";
  security.acme.acceptTerms = true;
}
