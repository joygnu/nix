{
  pkgs,
  config,
  lib,
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
    environment.systemPackages = with pkgs; [
      mysql-workbench
    ];
  };
}
