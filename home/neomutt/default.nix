{ pkgs, ... }:
{
  # programs.neomutt = {
    # enable = true;
    # sidebar.enable = true; 
    # vimKeys = true;
  # };
  programs.mbsync = {
    enable = true;
  };
  programs.msmtp = {
    enable = true;
  };

  home.packages = with pkgs;  [
    mutt-wizard    
    neomutt
    curl
    pass
    lynx
    notmuch
    abook
    mpop
    urlscan
  ];
}
