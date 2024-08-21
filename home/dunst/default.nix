{pkgs,...}:{
  services.dunst.enable = true;

  home.packages = with pkgs; [
  libnotify
  ];
}
