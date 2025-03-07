{
  pkgs,
  lib,
  config,
  ...
}: let
  restartAgsScript = pkgs.writeScriptBin "agsr" ''
    pkill ags
    ags
  '';
in {
  config = lib.mkIf config.ags.enable {
    environment.systemPackages = [restartAgsScript];
  };
}
