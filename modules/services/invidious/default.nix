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
      database.createLocally = true;
      settings = {
        visitor_data = "CgtCejNqaFI3OFRKayi_itrABjIKCgJDSBIEGgAgUg%3D%3D";
        po_token = "MnRABtWY7AOGP0A-wnxJn1zZGG26IkTdUtRAqBh9XWSV__ic5G7FfQxpDCwe3WII6tyAuMILGqEHV273Yh0ftcEOHMFq8Lf_ygWIZXDBF5hVIgd0_6aPdWrJ5nkVIs38ULsfl7j-5vN92a1wT4ltuSx69pYRfg==";
        db = {
          user = "invidious";
          dbname = "invidious";
        };
        statistics_enabled = true;
        popular_enabled = false;
        default_user_preferences = {
          default_home = "<none>";
          quality = "hd720";
          feed_menu = ["Subscriptions" "Playlists"];
        };
      };
    };
  };
}
