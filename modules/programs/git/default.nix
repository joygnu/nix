{
  mail,
  username,
  ...
}: {
  programs.git = {
    enable = true;
    userEmail = "${mail.a}";
    userName = "${username}";
    extraConfig = {
      init.defaultBranch = "main";
    };
  };
}
