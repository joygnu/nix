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
