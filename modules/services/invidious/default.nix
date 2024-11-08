{
  domain,
  mail,
  ...
}: {
  services.invidious = {
    enable = true;
    settings = {
      db = {
        user = "invidious";
        dbname = "invidious";
      };
    };
  };
  services.invidious.domain = "yt.${domain}";
  services.invidious.nginx.enable = true;
  security.acme.defaults.email = "${mail}";
  security.acme.acceptTerms = true;
}
