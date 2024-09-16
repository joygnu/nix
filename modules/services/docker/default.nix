{...}: {
  virtualisation.docker.rootless.enable = true;
  virtualisation.docker.enable = true;
  users.users.joy.extraGroups = ["docker"];
}
