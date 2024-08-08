{ pkgs, ... }:

{
  nixpkgs.config.packageOverrides = pkgs: {
    noriskclient-launcher = pkgs.callPackage  ./../NoRiskClient/default.nix { };
  };

  environment.systemPackages = with pkgs; [
  #hackerman
  noriskclient-launcher   
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
  #image/video/music/recording
  imv
  mpv
  cmus
  obs-studio
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
  gnome.gnome-clocks
  gnome-calculator
  gnome-disk-utility
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
