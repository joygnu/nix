{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    mutt-wizard
    neomutt
    msmtp
    curl
    isync
    pass
    lynx
    notmuch
    abook
    mpop
    urlscan
    vim
  ];
}
