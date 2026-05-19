{
  lib,
  pkgs,
  config,
  username,
  pkgs-stable,
  inputs,
  ...
}: {
  imports = [
    inputs.spicetify-nix.nixosModules.default
  ];

  options = {
    spotify.enable = lib.mkEnableOption "";
  };

  config = lib.mkIf config.spotify.enable {
    programs.spicetify = let
      spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.hostPlatform.system};
    in {
      enable = true;

      spotifyPackage = pkgs-stable.spotify;

      enabledExtensions = with spicePkgs.extensions; [
        spicy-lyrics
        adblock
        shuffle
        hidePodcasts
        trashbin
        playNext
        songStats
      ];
    };

    home-manager.users.${username}.wayland.windowManager.hyprland.settings = {
      bind = [
        "$mod, D, exec, spotify"
        "$mod, space, exec, ${pkgs.playerctl}/bin/playerctl --player=spotify play-pause"
        "$mod, comma, exec, ${pkgs.playerctl}/bin/playerctl --player=spotify previous"
        "$mod, period, exec, ${pkgs.playerctl}/bin/playerctl --player=spotify next"
        "$mod, equal, exec, ${pkgs.playerctl}/bin/playerctl --player=spotify volume 0.1+"
        "$mod, minus, exec, ${pkgs.playerctl}/bin/playerctl --player=spotify volume 0.1-"
      ];
    };
  };
}
