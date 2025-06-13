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
        visitor_data = "Cgt5QkVIY2NYcGxRcyiW7rjBBjIKCgJDSBIEGgAgPg%3D%3D";
        po_token = "MnShgFsN5cK_jqG4jM50vDJfC7dNzjAxYmSLKKCYdw9_iAGYMlfWty6Mcu7i53XPw5GBW4j14k_P6JFTBMva4aF8Va_7jJ0Xdo398bG9whUoLTrOeFvX0sVf-NfhfGuQPEteo1rdJB_TI0eHiNGEziuWLH28qA==";
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
