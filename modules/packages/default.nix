{ pkgs, ... }:

{

  environment.systemPackages = with pkgs; [
  #Games
  prismlauncher
  mangohud
  lutris
  #hackerman
  fastfetch
  cmatrix
  cava
  nitch
  gotop 
  sl
  cbonsai
  pipes
  #mutt
  mutt-wizard
  neomutt
  curl
  isync
  msmtp
  pass
  lynx
  notmuch
  abook
  #chromium
  brave
  freetube
  #image/video/music/recording
  imv
  mpv
  cmus
  obs-studio
  #gui stuff
  vesktop
  signal-desktop
  upscayl
  cinnamon.nemo
  firefox
  bottles
  boxbuddy
  #gnome
  gnome.gnome-clocks
  gnome-calculator
  gnome-disk-utility
  gnome-secrets
  #random shit 
  htop
  zulu17
  screen
  tree
  zip
  rar
  unzip
  unrar
  scrcpy
  appimage-run
  yt-dlp
  distrobox
  vim
  font-awesome
  #laptop
  brightnessctl
  ];  
}
