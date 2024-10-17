{
  security.doas.enable = true;
  security.sudo.enable = false;
  security.doas.extraRules = [
    {
      users = ["joy"];
      keepEnv = true;
      persist = true;
    }
  ];
  programs.git.enable = true;
  programs.git.config = {safe.directory = "*";};
}
