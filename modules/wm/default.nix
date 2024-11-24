{
  inputs,
  username,
  domain,
  ...
}: {
  imports = [
    ./gdm
    ./gnome
    ./hyprland
    ./polkit
    # ./stylix
    ./syncthing
  ];
  home-manager = {
    extraSpecialArgs = {
      inherit inputs;
      inherit username;
      inherit domain;
    };
    users = {
      "${username}" = import ./home;
    };
  };
}
