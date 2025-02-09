{
  username,
  lib,
  config,
  ...
}: {
  options = {
    syncthing-client.enable = lib.mkEnableOption "";
  };
  config = lib.mkIf config.syncthing-client.enable {
    services.syncthing = {
      enable = true;
      dataDir = "/home/${username}";
      openDefaultPorts = true;
      configDir = "/home/${username}/.config/syncthing";
      user = username;
      group = "users";
    };
  };
}
