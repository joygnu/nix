{
  pkgs,
  username,
  lib,
  config,
  ...
}: let
  backgroundUrl = "https://wallpapers.joygnu.org/wallpapers/anime/ghibli-japanese-walled-garden.png";
  backgroundSha256 = "sha256-10Lv25V0RG0mnw/O90DeVchCNWJbdktUADtuI+enEwM=";
in {
  options = {
    theme.enable = lib.mkEnableOption "";
  };
  config = lib.mkIf config.theme.enable {
    stylix = {
      enable = true;
      polarity = "dark";
      image = pkgs.fetchurl {
        url = backgroundUrl;
        sha256 = backgroundSha256;
      };
      base16Scheme = {
        base00 = "282828"; # ----
        base01 = "3c3836"; # ---
        base02 = "504945"; # --
        base03 = "665c54"; # -
        base04 = "bdae93"; # +
        base05 = "d5c4a1"; # ++
        base06 = "ebdbb2"; # +++
        base07 = "fbf1c7"; # ++++
        base08 = "cc241d"; # red
        base09 = "fe0819"; # orange
        base0A = "d79921"; # yellow
        base0B = "98971a"; # green
        base0C = "689d6a"; # aqua/cyan
        base0D = "458588"; # blue
        base0E = "b16286"; # purple
        base0F = "a89984"; # brown
      };
      cursor = {
        name = "Bibata-Modern-Ice";
        package = pkgs.bibata-cursors;
        size = 24;
      };

      fonts = {
        monospace = {
          package = pkgs.nerd-fonts.roboto-mono;
          name = "RobotoMono Nerd Font";
        };
        sizes = {
          applications = 12;
          terminal = 13;
          desktop = 12;
          popups = 12;
        };
      };
    };
    home-manager.users.${username} = {
      stylix = {
        enable = true;
        targets = {
          rofi.enable = false;
          dunst.enable = false;
          helix.enable = false;
          firefox.enable = false;
        };
      };
      xresources.path = ".config/.Xresources";
    };
    home-manager.users.root = {
      stylix = {
        enable = true;
        targets = {
          rofi.enable = false;
          dunst.enable = false;
          helix.enable = false;
        };
      };
    };
  };
}
