{
  mail,
  username,
  domain,
  ...
}: {
  programs.git = {
    enable = true;
    userEmail = "${mail.b}@${domain}";
    userName = "${username}";
    extraConfig = {
      init.defaultBranch = "main";
    };
  };
}
