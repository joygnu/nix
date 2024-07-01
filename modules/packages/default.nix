{ config, pkgs, ... }:

{

  environment.systemPackages = with pkgs; [
  #Games
  alacritty
  ark
  prismlauncher
  zulu17
  lutris
  mangohud
  #hackerman
  neovim
  vim
  fastfetch
  freshfetch
  cmatrix
  cava
  nitch
  htop
  gotop 
  #chromium
  brave
  freetube
  webcord-vencord
  #image/video/music/recording
  imv
  mpv
  cmus
  obs-studio
  #gui stuff
  ark
  keepassxc 
  signal-desktop
  transmission_3-gtk
  upscayl
  cinnamon.nemo
  firefox
  bottles
  thunderbird
  gnome.gnome-clocks
  gnome.gnome-calculator
  gnome.gnome-disk-utility
  #random utils
  pass
  tree
  rofi-wayland
  screen
  git 
  zip
  rar
  unzip
  unrar
  scrcpy
  appimage-run
  ytmdl
  yt-dlp
  boxbuddy
  distrobox
  ];  
}
