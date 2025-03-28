{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    mysql.enable = lib.mkEnableOption "";
  };
  config = lib.mkIf config.mysql.enable {
    services.mysql = {
      enable = true;
      package = pkgs.mariadb;
    };
    environment.systemPackages = [
      pkgs.mysql-workbench
    ];
    networking.firewall.allowedTCPPorts = [3306];
  };
}
