{pkgs, ...}: {
  home.packages = with pkgs; [
    git
    ncdu
    ffmpeg
    lm_sensors
    zip
    unzip
    yt-dlp
    wget
    cmatrix
    cava
    nitch
    gotop
    cbonsai
    pipes
    sops
    sl
  ];
}
