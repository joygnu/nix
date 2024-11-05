{pkgs, ...}: {
  home.packages = with pkgs; [
    git
    htop
    ncdu
    sc-im
    libnotify
    brightnessctl
    ffmpeg
    lm_sensors
    alejandra
    zip
    unzip
    yt-dlp
    wget
    cmatrix
    cava
    nitch
    gotop
    sl
    cbonsai
    pipes
  ];
}
