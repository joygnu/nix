{ config, pkgs, ... }:

{
  services.ollama.enable = true;
  services.blueman.enable = true;
  hardware.bluetooth.enable = true;
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
  services.flatpak.enable = true; 
  environment.systemPackages = with pkgs; [
  #Games
  alacritty
  ark
  prismlauncher
  zulu17
  lutris
  mangohud
  #hackerman
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
  cmus
  #gui stuff
  ark
  keepassxc 
  signal-desktop
  transmission-gtk
  upscayl
  cinnamon.nemo
  firefox
  bottles
  thunderbird
  gnome.gnome-clocks
  gnome.gnome-calculator
  gnome.gnome-disk-utility
  #random utils
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
