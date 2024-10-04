{...}: {
  home-manager.users.joy.programs.mpv = {
    enable = true;
    bindings = {
      x = "add speed 0.1";
      z = "add speed -0.1";
      "," = "frame-back-step";
      "." = "frame-step";
      space = "cycle-values speed 1 2";
      DOWN = "add volume -5";
      UP = "add volume 5";
    };
  };
}
