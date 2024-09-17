{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    #gui
    uget
    keepassxc
    vesktop
    signal-desktop
    upscayl
    bottles
    boxbuddy
    waydroid
    transmission_4-gtk
    vscodium
    networkmanagerapplet
    ferdium
    drawio
    imv
    cmus
    obs-studio
    gnome-calculator
    gnome-disk-utility
    gnome-clocks
    gnome-calendar
  ];
}
