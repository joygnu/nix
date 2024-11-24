{
  pkgs,
  config,
  lib,
  username,
  ...
}: let
  gruvboxPlus = import ./gruvbox-plus.nix {inherit pkgs;};
in {
  config = lib.mkIf config.theme.enable {
    home-manager.users.${username} = {
      home.file = {
        ".local/share/icons/GruvboxPlus".source = "${gruvboxPlus}";
      };

      gtk = {
        enable = true;
        iconTheme.package = gruvboxPlus;
        iconTheme.name = "GruvboxPlus";
        gtk2.configLocation = "/home/${username}/.config/gtk-2.0/gtkrc";
      };
    };
  };
}
