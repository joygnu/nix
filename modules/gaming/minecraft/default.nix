{
  lib,
  config,
  pkgs,
  ...
}: {
  options = {
    minecraft.enable = lib.mkEnableOption "";
  };
  config = lib.mkIf config.minecraft.enable {
    environment.systemPackages = [
      pkgs.prismlauncher
    ];
  };
}
