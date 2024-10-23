{
  home-manager = {
    backupFileExtension = "bkp";
    users.joy = {
      programs.home-manager.enable = true;
      home = {
        username = "joy";
        homeDirectory = "/home/joy";
        stateVersion = "23.11";
      };
    };
  };
}
