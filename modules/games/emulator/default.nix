{
  pkgs,
  lib,
  config,
  pkgs-24-11,
  ...
}: {
  options = {
    emulator.enable = lib.mkEnableOption "";
  };
  config = lib.mkIf config.emulator.enable {
    environment.systemPackages = with pkgs; [
      azahar
      cemu
      pkgs-24-11.torzu
    ];
  };
}
