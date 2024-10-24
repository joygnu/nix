{pkgs, ...}: {
  home.packages = with pkgs; [
    git
    htop
    ncdu
    libnotify
    brightnessctl
    ffmpeg
    lm_sensors
    alejandra
    tree
    zip
    unzip
    yt-dlp
    wget
    fastfetch
    cmatrix
    cava
    nitch
    gotop
    sl
    cbonsai
    pipes
  ];
}
