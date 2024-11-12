{
  pkgs,
  config,
  lib,
  ...
}: {
  home.packages = with pkgs; [
    hyprpicker
    playerctl
    rofimoji
    pwvucontrol
    pulseaudioFull
    sent
    imv
    signal-desktop
    keepassxc
    vesktop
    bottles
    boxbuddy
    ferdium
    drawio
    distrobox
    obs-studio
    transmission_4-gtk
    gnome-clocks
    gnome-calculator
    gnome-disk-utility
    gnome-sound-recorder
    kdePackages.kdenlive
    sqlitebrowser
  ];
  gtk.gtk2.configLocation = "${config.home.homeDirectory}/.config/gtk-2.0/gtkrc";
  xresources.path = ".config/.Xresources";
  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (lib.getName pkg) [
      "drawio"
    ];
}
