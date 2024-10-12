{
  sops.defaultSopsFile = ./secrets.yaml;
  sops.defaultSopsFormat = "yaml";

  sops.age.keyFile = "/home/joy/.config/age/keys.txt";

  sops.secrets.mail = {
    owner = "joy";
  };
  sops.secrets.spyware = {
    owner = "joy";
  };
  sops.secrets.contact = {
    owner = "joy";
  };

  users.users.sometestservice = {
    home = "/var/lib/sometestservice";
    createHome = true;
    isSystemUser = true;
    group = "sometestservice";
  };
  users.groups.sometestservice = {};
}
