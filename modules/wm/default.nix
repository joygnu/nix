{inputs, ...}: {
  imports = [
    ./hyprland
    ./theme
    ./gnome
    ./polkit
    ./syncthing
    ./gdm
  ];
  home-manager = {
    extraSpecialArgs = {inherit inputs;};
    users = {
      "joy" = import ./home;
    };
  };
}
