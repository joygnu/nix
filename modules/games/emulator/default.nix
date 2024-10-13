{
  pkgs,
  lib,
  config,
  ...
}: {
  config = lib.mkIf config.games.enable {
    environment.systemPackages = with pkgs; [
      cemu
    ];
  };
}
