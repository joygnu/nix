{ ... }:
{
  accounts.email.accounts.mail.neomutt.enable = true;
  programs.neomutt = {
    enable = true;
    sidebar.enable = true; 
    vimKeys = true;
  };
}
