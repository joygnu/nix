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
        visitor_data = "CgtvcjExZVB1UERHZyiN8M7GBjIKCgJDSBIEGgAgPg%3D%3D";
        po_token = "Mnhkpcjibbiqc2SZss3UwQqFJtyp3WhIlB1Wwg0uNA35J5hNQ1UcvyrSMPp1dbo6q-NlYHUaKFB8tPYRuYDa14R2nghkdDYj8fh-JizAlDF9HIoG3CYJwpfeBf34kVQIB3fXKlyEllVFYtXMT-XNJY60s29w7r9bHCE=";
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
