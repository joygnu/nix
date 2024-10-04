{lib, ...}: {
  programs.alacritty = {
    enable = true;
    settings = {
      window = {
        padding = {
          x = 5;
          y = 5;
        };
      };
      colors = {
        bright = {
          black = lib.mkForce "#928374";
          red = lib.mkForce "#fb4934";
          green = lib.mkForce "#b8bb26";
          yellow = lib.mkForce "#fabd2f";
          blue = lib.mkForce "#83a598";
          magenta = lib.mkForce "#d3869b";
          cyan = lib.mkForce "#8ec07c";
          white = lib.mkForce "#ebdbb2";
        };
      };
    };
  };
}
