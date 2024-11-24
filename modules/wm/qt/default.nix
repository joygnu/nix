{
  lib,
  config,
  username,
  pkgs,
  ...
}: {
  config = lib.mkIf config.theme.enable {
    home-manager.users.${username} = {
      qt = {
        enable = true;
        style.name = "adwaita-dark";
        style.package = pkgs.adwaita-qt;
        platformTheme.name = "adwaita";
      };
    };
  };
}
