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
      port = 9090;
      openFirewall = true;
      settings = {
        WebService = {
          AllowUnencrypted = true;
          Origins = lib.mkForce "http://192.168.1.2:9090 https://192.168.1.2:9090";
        };
      };
      plugins = [
        pkgs.cockpit-files
        pkgs.cockpit-podman
        pkgs.cockpit-machines
      ];
    };
    environment.systemPackages = [
      pkgs.kexec-tools
    ];
  };
}
