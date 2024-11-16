{domain, ...}: {
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
}
