{
  pkgs,
  config,
  lib,
  ...
}: {
  options = {
    vpn-home.enable = lib.mkEnableOption "";
  };
  config = lib.mkIf config.vpn-home.enable {
    networking.nat.enable = true;
    networking.nat.externalInterface = "enp1s0";
    networking.nat.internalInterfaces = ["wg0"];
    networking.firewall = {
      allowedUDPPorts = [51820];
    };

    networking.wireguard.interfaces = {
      wg0 = {
        ips = ["10.100.0.1/24"];

        listenPort = 51820;

        postSetup = ''
          ${pkgs.iptables}/bin/iptables -t nat -A POSTROUTING -s 10.100.0.0/24 -o enp1s0 -j MASQUERADE
        '';

        postShutdown = ''
          ${pkgs.iptables}/bin/iptables -t nat -D POSTROUTING -s 10.100.0.0/24 -o enp1s0 -j MASQUERADE
        '';

        generatePrivateKeyFile = true;
        privateKeyFile = "/var/lib/vpn";

        peers = [
          {
            publicKey = "5kytH3hiBZMSCV8dePBBrd4oC0r5d+jANFjeaR5AVjg=";
            allowedIPs = ["10.100.0.2/32"];
          }
        ];
      };
    };
  };
}
