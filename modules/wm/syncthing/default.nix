{
  services.syncthing = {
    enable = true;
    dataDir = "/home/joy";
    openDefaultPorts = true;
    configDir = "/home/joy/.config/syncthing";
    user = "joy";
    group = "users";
  };
}
