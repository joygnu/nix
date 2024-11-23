{
  pkgs,
  lib,
  ...
}: {
  home.packages = with pkgs; [
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
    obs-studio
    transmission_4-gtk
    gnome-clocks
    gnome-calculator
    gnome-disk-utility
    gnome-sound-recorder
    kdePackages.kdenlive
    sqlitebrowser
  ];
  xresources.path = ".config/.Xresources";
  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (lib.getName pkg) [
      "drawio"
    ];
}
