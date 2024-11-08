{
  inputs,
  username,
  domain,
  ...
}: let
  mail = {
    a = "contact";
    b = "mail";
    c = "spyware";
  };
in {
  home-manager = {
    extraSpecialArgs = {
      inherit inputs;
      inherit username;
      inherit mail;
      inherit domain;
    };
    users = {
      "${username}" = import ./home.nix;
      "root" = import ./root.nix;
    };
  };
}
