{
  lib,
  config,
  username,
  ...
}: {
  options = {
    foot.enable = lib.mkEnableOption "";
  };

  config = lib.mkIf config.foot.enable {
    home-manager.users.${username} = {
      programs.foot = {
        enable = true;
        settings = {
          main = {
            pad = "2x2";
            font = "RobotoMono Nerd Font:size=12";
          };

          colors = {
            "foreground" = "d5c4a1";
            "background" = "282828";
            "regular0" = "282828";
            "regular1" = "cc241d";
            "regular2" = "98971a";
            "regular3" = "d79921";
            "regular4" = "458588";
            "regular5" = "b16286";
            "regular6" = "689d6a";
            "regular7" = "d5c4a1";
            "bright0" = "504945";
            "bright1" = "fb4934";
            "bright2" = "b8bb26";
            "bright3" = "fabd2f";
            "bright4" = "83a598";
            "bright5" = "d3869b";
            "bright6" = "8ec07c";
            "bright7" = "ebdbb2";
          };
        };
      };
    };
  };
}
