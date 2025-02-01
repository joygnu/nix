{
  mail,
  username,
  ...
}: {
  programs.git = {
    enable = true;
    config = {
      safe.directory = "*";
      user.name = "${username}";
      user.email = "${mail}";
      init.defaultBranch = "main";
      pull.rebase = "true";
    };
  };
}
