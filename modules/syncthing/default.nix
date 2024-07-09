{ ... }:

{
  services = {
  syncthing = {
    enable = true;
    user = "joy";
    dataDir = "/home/joy/";
    configDir = "/home/joy/.config/syncthing";  
    };
  };
}
