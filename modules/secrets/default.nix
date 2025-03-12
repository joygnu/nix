{
  username,
  inputs,
  pkgs,
  ...
}: {
  imports = [inputs.sops-nix.nixosModules.sops];
  sops.defaultSopsFile = ./secrets.yaml;
  sops.defaultSopsFormat = "yaml";

  sops.age.keyFile = "/home/${username}/.config/age/keys.txt";

  sops.secrets.mail = {
    owner = username;
  };
  sops.secrets.spyware = {
    owner = username;
  };
  sops.secrets.contact = {
    owner = username;
  };
  sops.secrets.calendar = {
    owner = username;
  };
  environment.systemPackages = [
    pkgs.sops
  ];
}
