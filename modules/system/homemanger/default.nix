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
    users.root = {
      programs.home-manager.enable = true;
      home = {
        username = "root";
        homeDirectory = "/root";
        stateVersion = "23.11";
      };
    };
  };
}
