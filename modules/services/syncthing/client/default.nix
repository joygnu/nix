{
  username,
  lib,
  config,
  ...
}: {
  options = {
    sync-client.enable = lib.mkEnableOption "";
  };
  config = lib.mkIf config.sync-client.enable {
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
