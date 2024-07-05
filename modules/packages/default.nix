{ config, pkgs, ... }:

{

  environment.systemPackages = with pkgs; [
  #Games
  prismlauncher
  mangohud
  #hackerman
  fastfetch
  freshfetch
  cmatrix
  cava
  nitch
  htop
  gotop 
  #mutt
  isync
  mutt-wizard
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
  transmission_3-gtk
  upscayl
  cinnamon.nemo
  firefox
  bottles
  boxbuddy
  gnome.gnome-clocks
  gnome-calculator
  gnome-disk-utility
  #random utils
  gnat14 
  zulu17
  libgccjit
  tree
  screen
  git 
  zip
  rar
  unzip
  unrar
  scrcpy
  appimage-run
  yt-dlp
  distrobox
  vim
  ];  
}
