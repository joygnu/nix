{
  pkgs,
  lib,
  config,
  pkgs-stable,
  ...
}: {
  options = {
    emulator.enable = lib.mkEnableOption "";
  };
  config = lib.mkIf config.emulator.enable {
    environment.systemPackages = with pkgs; [
      cemu
      pkgs-stable.torzu
    ];
  };
}
