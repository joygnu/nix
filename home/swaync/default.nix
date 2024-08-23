{pkgs,...}:{
  services.swaync.enable = true;

  home.packages = with pkgs; [
  libnotify
  ];
}
