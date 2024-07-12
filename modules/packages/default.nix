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
  htop
  gotop 
  #mutt
  mutt-wizard
  isync
  msmtp
  neomutt
  pass
  #chromium
  brave
  freetube
  #image/video/music/recording
  imv
  mpv
  cmus
  obs-studio
  #gui stuff
  ark
  vesktop
  keepassxc 
  signal-desktop
  upscayl
  cinnamon.nemo
  firefox
  bottles
  boxbuddy
  gnome.gnome-clocks
  gnome-calculator
  gnome-disk-utility
  #random shit 
  brightnessctl
  gnat14 
  libgccjit
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
  ];  
}
