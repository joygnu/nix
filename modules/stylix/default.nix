{ pkgs, ... }:

{
  stylix = {
    enable = true;
   
   base16Scheme = {
      base00 = "282828";
      base01 = "3c3836";
      base02 = "504945";
      base03 = "665c54";
      base04 = "bdae93";
      base05 = "d5c4a1";
      base06 = "ebdbb2";
      base07 = "fbf1c7";
      base08 = "cc241d";
      base09 = "fe8019";
      base0A = "d78821";
      base0B = "98971a";
      base0C = "689d6a";
      base0D = "458588";
      base0E = "b16286";
      base0F = "d65d0e";
    };
 
    image = ./wallpaper.png; 

    cursor = { 
      name = "Bibata-Modern-Ice";
      package = pkgs.bibata-cursors; 
      size = 24;
    };
  
    fonts = {
       sizes = {
       applications = 12;
        terminal = 14;
        desktop = 12;
        popups = 12;
      };
    };
  };
}
