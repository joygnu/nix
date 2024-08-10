{ ... }:
{
  programs.neomutt = {
    enable = true;
    sidebar.enable = true; 
    vimKeys = true;
  };
  programs.mbsync = {
    enable = true;
  };
  programs.msmtp = {
    enable = true;
  };
}
