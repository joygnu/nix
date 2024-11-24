{
  services.dunst = {
    enable = true;
    settings = {
      global = {
        background = "#282828";
        foreground = "#D5C4A1";
        geometry = "300x60-3+200";
        padding = 8;
        horizontal_padding = 8;
        separator_height = 2;
        frame_width = 4;
        corner_radius = 5;
        font = "DejaVuSansMono 12";
        alignment = "center";
        vertical_alignment = "center";
        ellipsize = "middle";
        ignore_newline = false;
      };

      urgency_low = {
        frame_color = "#98971a";
      };

      urgency_normal = {
        frame_color = "#458588";
      };

      urgency_critical = {
        frame_color = "#98971a";
      };
    };
  };
}
