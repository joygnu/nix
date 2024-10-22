{
  programs.git = {
    enable = true;
    userEmail = "contact@joygnu.org";
    userName = "joygnu";
    extraConfig = {
      init.defaultBranch = "main";
    };
  };
}
