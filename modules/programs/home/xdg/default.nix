{config, ...}: {
  xdg.userDirs = {
    enable = true;
    download = "${config.home.homeDirectory}/dl";
    desktop = "${config.home.homeDirectory}/dl";
  };
}
