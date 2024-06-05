{ config, pkgs, ... }:

{
  virtualisation.docker.rootless.enable = true;
  virtualisation.docker.enable = true;
  nixpkgs.config.allowUnfree = true;
  programs.steam.enable = true;
  services = {
    syncthing = {
        enable = true;
        user = "joy";
        dataDir = "/home/joy/sync";
        configDir = "/home/joy/.config/syncthing";  
    };
  };
 
  environment.systemPackages = with pkgs; [
  #Games
  alacritty
  ark
  rofi
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
  moc
  obs-studio
  #gui stuff
  ark
  keepassxc 
  signal-desktop
  gnome.gnome-disk-utility
  transmission-gtk
  upscayl
  cinnamon.nemo
  bottles
  thunderbird
  chatterino2
  gnome.gnome-clocks
  gnome.gnome-calculator
  firefox
  #random utils
  git 
  zip
  rar
  unzip
  unrar
  scrcpy
  lm_sensors
  appimage-run
  ytmdl
  yt-dlp
  distrobox
  wget
  nginx
  ];  
}
