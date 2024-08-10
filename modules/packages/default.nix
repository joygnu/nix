{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
  #hackerman
  fastfetch
  cmatrix
  cava
  nitch
  gotop 
  sl
  cbonsai
  pipes
  #image/video/music/recording
  imv
  mpv
  cmus
  obs-studio
  pulseaudioFull
  #gui stuff
  keepassxc
  vesktop
  signal-desktop
  upscayl
  nemo
  firefox
  bottles
  boxbuddy
  waydroid
  transmission_4-gtk  
  #gnome
  gnome-calculator
  gnome-disk-utility
  gnome.geary
  gnome.gnome-clocks
  #random shit 
  htop
  bat
  zulu17
  screen
  tree
  zip
  unzip
  scrcpy
  appimage-run
  yt-dlp
  distrobox
  font-awesome
  lm_sensors
  #laptop
  brightnessctl
  networkmanagerapplet
  ];  
}
