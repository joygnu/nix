{username, ...}: {
  home-manager.users.${username} = {
    programs.zathura = {
      enable = true;
      mappings = {
        p = "print";
      };
    };
  };
}
