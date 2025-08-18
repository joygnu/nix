{
  domain,
  lib,
  config,
  ...
}: {
  options = {
    invidious.enable = lib.mkEnableOption "";
  };

  config = lib.mkIf config.invidious.enable {
    services.invidious = {
      enable = true;
      sig-helper.enable = true;
      domain = "yt.${domain.a}";
      nginx.enable = true;
      port = 1939;
      database.createLocally = true;
      settings = {
        visitor_data = "CgtodUNqc01mS3hCQSi1sYfFBjIKCgJDSBIEGgAgMA%3D%3D";
        po_token = "MngE0zlQ-xGRfgTvXASLGjptj2y11oCZJ3mF1vTJdUIOH9D6rzXYp-EqWa4drrYhe74YN03k4w_qVL9qjOiGre2ooSdVXvIm5peAphKoXfggtD4JmQDQVBvidxN4szN858BdFh5td4C9YP7AmCw8nuGPh0k3-ELaKcs=";
        db = {
          user = "invidious";
          dbname = "invidious";
        };
        statistics_enabled = true;
        popular_enabled = false;
        default_user_preferences = {
          default_home = "<none>";
          quality = "dash";
          feed_menu = ["Subscriptions" "Playlists"];
        };
      };
    };
  };
}
