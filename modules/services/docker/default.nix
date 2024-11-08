{username, ...}: {
  virtualisation.docker.rootless.enable = true;
  virtualisation.docker.enable = true;
  users.users.${username}.extraGroups = ["docker"];
}
