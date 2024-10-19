{lib, ...}: {
  programs.foot = {
    enable = true;
    settings = {
      main = {
        pad = "2x2";
      };

      colors = {
        "bright0" = lib.mkForce "504945";
        "bright1" = lib.mkForce "fb4934";
        "bright2" = lib.mkForce "b8bb26";
        "bright3" = lib.mkForce "fabd2f";
        "bright4" = lib.mkForce "83a598";
        "bright5" = lib.mkForce "d3869b";
        "bright6" = lib.mkForce "8ec07c";
        "bright7" = lib.mkForce "ebdbb2";
      };
    };
  };
}
