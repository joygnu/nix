{pkgs, ...}: let
  restartAgsScript = pkgs.writeScriptBin "agsr" ''
    pkill ags
    ags
  '';
in {
  environment.systemPackages = [restartAgsScript];
}
