{inputs, ...}: {
  imports = [
    ./hyprland
    ./theme
    ./gnome
    ./polkit
    ./gdm
  ];
  home-manager = {
    extraSpecialArgs = {inherit inputs;};
    users = {
      "joy" = import ./home;
    };
  };
}
