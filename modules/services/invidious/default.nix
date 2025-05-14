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
        visitor_data = "CgtrME1YZ2JZdU9RRSiYh5PBBjIKCgJDSBIEGgAgQQ%3D%3D";
        po_token = "MnROVHnvQ87GjU5sjU2snce_OBAwSgTm_Jv0rieyblK3WZKjog6-Rbp1aFHnb6ct5Iyla1J3dOAerVi3hIcHQ6amB_JrAW1M39EavvCvq9OJl5iCAIY95rHldv1IMpuzrSBYoDEPeLk-U4_fd5QhAehmLrhwoA==";
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
