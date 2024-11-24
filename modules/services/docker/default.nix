{
  lib,
  config,
  username,
  ...
}: {
  options = {
    docker.enable = lib.mkEnableOption "";
  };

  config = lib.mkIf config.docker.enable {
    virtualisation.docker.rootless.enable = true;
    virtualisation.docker.enable = true;
    users.users.${username}.extraGroups = ["docker"];
  };
}
