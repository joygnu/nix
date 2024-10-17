{
  programs.git = {
    enable = true;
    userEmail = "mail@joygnu.org";
    userName = "joygnu";
    extraConfig = {
      init.defaultBranch = "main";
    };
  };
}
