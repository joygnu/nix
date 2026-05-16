{
  lib,
  pkgs,
  config,
  username,
  pkgs-24-11,
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
    programs.spicetify = {
      enable = true;
      spotifyPackage = pkgs-24-11.spotify;
    };

    home-manager.users.${username}.wayland.windowManager.hyprland.settings = {
      bind = [
        "$mod, D, exec, spotify --ozone-platform=wayland --enable-features=UseOzonePlatform,WebRTCPipeWireCapturer,WaylandWindowDecorations"
        "$mod, space, exec, ${pkgs.playerctl}/bin/playerctl --player=spotify play-pause"
        "$mod, comma, exec, ${pkgs.playerctl}/bin/playerctl --player=spotify previous"
        "$mod, period, exec, ${pkgs.playerctl}/bin/playerctl --player=spotify next"
        "$mod, equal, exec, ${pkgs.playerctl}/bin/playerctl --player=spotify volume 0.1+"
        "$mod, minus, exec, ${pkgs.playerctl}/bin/playerctl --player=spotify volume 0.1-"
      ];
    };
  };
}
