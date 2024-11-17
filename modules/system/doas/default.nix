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
}
