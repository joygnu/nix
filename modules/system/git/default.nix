{
  mail,
  username,
  domain,
  ...
}: {
  programs.git = {
    enable = true;
    config = {
      safe.directory = "*";
      user.name = "${username}";
      user.email = "${mail.a}@${domain.a}";
      init.defaultBranch = "main";
      pull.rebase = "true";
    };
  };
}
