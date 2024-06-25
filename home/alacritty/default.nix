{ config, lib, pkgs, ... }:

{
  programs.alacritty = {
    enable = true;
    settings = {
      # Font settings
      font = {
        size = 14;
      };

      # Color scheme
      colors = {
        primary = {
          background = "0x282828";
          foreground = "0xebdbb2";
        };
        normal = {
          black = "0x665c54";
          blue = "0x458588";
          cyan = "0x689d6a";
          green = "0x98971a";
          magenta = "0xb16286";
          red = "0xcc241d";
          white = "0xa89984";
          yellow = "0xd79921";
        };
        bright = {
          black = "0x7c6f64";
          blue = "0x83a598";
          cyan = "0x8ec07c";
          green = "0xb8bb26";
          magenta = "0xd3869b";
          red = "0xfb4934";
          white = "0xbdae93";
          yellow = "0xfabd2f";
        };
      };

      # Cursor settings
      cursor = {
        style = "Block";
        vi_mode_style = "Block";
      };

      # Window padding
      window = {
        padding = {
          x = 5;
          y = 5;
        };
      };
    };
  };
}
