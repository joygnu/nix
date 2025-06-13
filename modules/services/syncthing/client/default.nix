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
      settings = {
        devices = {
          "server" = {id = "DX5FGCQ-MS5HSOO-D5OT3VJ-6Q2UW74-FJW6MMA-FNXVMRO-4X5IXAB-KXT32AO";};
        };
        folders = {
          "Documents" = {
            path = "/home/${username}/doc";
            devices = ["server"];
          };
          "Music" = {
            path = "/home/${username}/media/music";
            devices = ["server"];
          };
        };
      };
    };
  };
}
