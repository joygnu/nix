{mail, ...}: {
  programs.git = {
    enable = true;
    config = {
      safe.directory = "*";
      user.name = "joy";
      user.email = "${mail}";
      init.defaultBranch = "main";
    };
  };
}
