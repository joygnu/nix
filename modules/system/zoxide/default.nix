{username, ...}: {
  home-manager.users.${username} = {
    programs.zoxide = {
      enable = true;
    };
  };
  home-manager.users.root = {
    programs.zoxide = {
      enable = true;
    };
  };
}
