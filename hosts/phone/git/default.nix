{
  mail,
  domain,
  username,
  ...
}: {
  programs.git = {
    enable = true;
    userEmail = "${mail.a}@${domain.a}";
    userName = "${username}";
    extraConfig = {
      init.defaultBranch = "main";
    };
  };
}
