{ lib, ... }: {
  programs.foot = {
    enable = true;
    settings = {
      # terminal = {
        # padding = "5 5";
      # };

      colors = {
        # "bright-black"   = lib.mkForce "#504945";
        # "bright-red"     = lib.mkForce "#fb4934";
        # "bright-green"   = lib.mkForce "#b8bb26";
        # "bright-yellow"  = lib.mkForce "#fabd2f";
        # "bright-blue"    = lib.mkForce "#83a598";
        # "bright-magenta" = lib.mkForce "#d3869b";
        # "bright-cyan"    = lib.mkForce "#8ec07c";
        # "bright-white"   = lib.mkForce "#ebdbb2";
      };
    };
  };
}
