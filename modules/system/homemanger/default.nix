{username, ...}: {
  home-manager = {
    backupFileExtension = "bkp";
    users.${username} = {
      programs.home-manager.enable = true;
      home = {
        username = username;
        homeDirectory = "/home/" + username;
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
