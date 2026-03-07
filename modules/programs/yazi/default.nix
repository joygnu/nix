{username, ...}: {
  home-manager.users.${username} = {
    programs.yazi = {
      enable = true;
    };
  };
}
