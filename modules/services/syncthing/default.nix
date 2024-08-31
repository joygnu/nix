{...}: {
  services = {
    syncthing = {
      enable = true;
      user = "joy";
      configDir = "/home/joy/.config/syncthing";
    };
  };
}
