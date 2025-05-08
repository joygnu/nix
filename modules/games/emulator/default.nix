{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    emulator.enable = lib.mkEnableOption "";
  };
  config = lib.mkIf config.emulator.enable {
    environment.systemPackages = with pkgs; [
      cemu
      torzu
    ];
  };
}
