{lib, ...}: {
  home-manager.users.joy.services.dunst = {
    enable = true;
    settings = {
      global = {
        background = lib.mkForce "#282828";
        foreground = lib.mkForce "#D5C4A1";
        geometry = "300x60-3+200";
        padding = 8;
        horizontal_padding = 8;
        separator_height = 2;
        frame_width = 4;
        corner_radius = 5;
        font = lib.mkForce "DejaVuSansMono 12";
        alignment = "center";
        vertical_alignment = "center";
        ellipsize = "middle";
        ignore_newline = false;
      };

      urgency_low = {
        frame_color = lib.mkForce "#98971a";
      };

      urgency_normal = {
        frame_color = lib.mkForce "#458588";
      };

      urgency_critical = {
        frame_color = lib.mkForce "#98971a";
      };
    };
  };
}
