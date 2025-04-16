{
  pkgs,
  username,
  inputs,
  ...
}: let
  backgroundUrl = "https://wallpapers.joygnu.org/wallpapers/minimalistic/gruvbox-nix.png";
  backgroundSha256 = "sha256-WuLGBomGcJxDgHWIHNN2qyqCzltvo45PiT062ZwAQ6I=";
  gruvboxPlus = import ./gruvbox-plus.nix {inherit pkgs;};
in {
  imports = [inputs.stylix.nixosModules.stylix];

  stylix.targets.chromium.enable = false;

  stylix = {
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
      base09 = "d65d0e"; # orange
      base0A = "d79921"; # yellow
      base0B = "98971a"; # green
      base0C = "689d6a"; # aqua/cyan
      base0D = "458588"; # blue
      base0E = "b16286"; # purple
      base0F = "a89984"; # gray
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
      iconTheme = {
        enable = true;
        package = gruvboxPlus;
        dark = "GruvboxPlus";
        light = "GruvboxPlus";
      };

      targets = {
        rofi.enable = false;
        helix.enable = false;
        firefox.enable = false;
        qt.platform = "qtct";
      };
    };
    home.file = {
      ".local/share/icons/GruvboxPlus".source = "${gruvboxPlus}";
    };
    home.sessionVariables = {
      COLORTERM = "truecolor";
    };

    xresources.path = ".config/.Xresources";
    gtk.gtk2.configLocation = "/home/${username}/.config/gtk-2.0/gtkrc";
  };
  home-manager.users.root.stylix.enable = false;
}
