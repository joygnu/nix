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
        visitor_data = "CgstLXo0ZGdHRmNDMCjqtsXFBjIKCgJDSBIEGgAgWQ%3D%3D";
        po_token = " Mngcn31plvi5sxyjiVnAgV2xaDNNYyu8d_BqN-M2Kik8RLCBNgIXR5pPeu5_Ri3gTlY8NOcs9gObGyDSZ-_2rOUOR84KaF-u1Hyh4sbN3JmwGC15yKu9BA1On63p_dDRHOvxfwugpqOz57WTc8MFwV8AeBgBVr15xPc=";
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
