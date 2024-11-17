{
  inputs,
  username,
  domain,
  nixpath,
  pkgs-stable,
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
      inherit nixpath;
      inherit pkgs-stable;
    };
    users = {
      "${username}" = import ./user.nix;
      "root" = import ./root.nix;
    };
  };
}
