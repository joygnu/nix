{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    htop
    sent
    texliveFull
    alejandra
    bat
    screen
    tree
    zip
    unzip
    scrcpy
    appimage-run
    yt-dlp
    distrobox
    lm_sensors
    brightnessctl
    ncdu
    git
    lazygit
    ffmpeg
    libnotify
    font-awesome
    imagemagick
    zoxide
    fastfetch
    cmatrix
    cava
    nitch
    gotop
    sl
    cbonsai
    pipes
    pulseaudioFull
    cmus
  ];
}