{
  lib,
  config,
  ...
}: {
  options = {
    networking.enable = lib.mkEnableOption "";
  };
  config = lib.mkIf config.networking.enable {
    networking.networkmanager.enable = true;
    networking.firewall.allowedTCPPorts = [80 443];
    networking.nameservers = ["9.9.9.9" "149.112.112.112" "2620:fe::fe" "2620:fe::9"];
  };
}
