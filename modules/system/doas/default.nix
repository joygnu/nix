{username, ...}: {
  security.doas.enable = true;
  security.sudo.enable = false;
  security.doas.extraRules = [
    {
      users = [username];
      keepEnv = true;
      persist = true;
    }
  ];
  programs.git.enable = true;
  programs.git.config = {safe.directory = "*";};
}
