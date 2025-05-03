{
  pkgs,
  domain,
  lib,
  config,
  ...
}: {
  options = {
    invidious.enable = lib.mkEnableOption "";
  };

  config = lib.mkIf config.invidious.enable {
    services.invidious.package = pkgs.invidious.override {
      versions = {
        invidious = {
          hash = "sha256-u3ksHE4pBTmE4PI85lPcfr0kkx7un2V3fdY4hNn2KPM=";
          version = "2.20250502.0";
          date = "2025.05.02";
          commit = "7579adc";
          rev = "7579adc3a3f23958afc4f11c9c52302f9962f879";
        };
        videojs = {
          hash = "sha256-jED3zsDkPN8i6GhBBJwnsHujbuwlHdsVpVqa1/pzSH4";
        };
      };
    };
    services.invidious = {
      enable = true;
      sig-helper.enable = true;
      domain = "yt.${domain.a}";
      nginx.enable = true;
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
          quality = "dash";
          feed_menu = ["Subscriptions" "Playlists"];
        };
      };
    };
  };
}
