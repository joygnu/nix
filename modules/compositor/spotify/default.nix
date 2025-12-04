{
  lib,
  pkgs,
  config,
  username,
  ...
}: {
  options = {
    spotify.enable = lib.mkEnableOption "";
  };
  config = lib.mkIf config.spotify.enable {
    environment.systemPackages = with pkgs; [
      spotify
    ];
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
