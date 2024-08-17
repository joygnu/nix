{ ... }:
{
  programs.hyprlock = {
    enable = true;
      settings = {
        general = {
          grace = 300;
          hide_cursor = true;
          no_fade_in = false;
        };
      
        background = [
          {
            path = "screenshot";
            blur_passes = 3;
            blur_size = 8;
          }
        ];
      
        input-field = [
          {
            size = "200, 50";
            position = "0, -80";
            monitor = "";
            dots_center = true;
            fade_on_empty = false;
            font_color = "rgb(209, 193, 158)";
            inner_color = "rgb(40, 40, 40)";
            outer_color = "rgb(69, 133, 136)";
            outline_thickness = 5;
            shadow_passes = 2;
          }
        ];
      };      
  };
}
