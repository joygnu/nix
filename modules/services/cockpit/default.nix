{
  config,
  lib,
  pkgs,
  ...
}: {
  options = {
    cockpit.enable = lib.mkEnableOption "";
  };
  config = lib.mkIf config.cockpit.enable {
    services.cockpit = {
      enable = true;
      openFirewall = true;
      settings = {
        WebService = {
          AllowUnencrypted = true;
          Origins = lib.mkForce "https://192.168.1.2:9090 http://192.168.1.2:9090";
        };
      };
      plugins = [
        pkgs.cockpit-files
        pkgs.cockpit-podman
        pkgs.cockpit-machines
      ];
    };
  };
}
