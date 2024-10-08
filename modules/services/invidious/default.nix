{
  services.invidious = {
    enable = true;
    settings = {
      db = {
        user = "invidious";
        dbname = "invidious";
      };
      # host_binding = "0.0.0.0";
    };
  };
}
