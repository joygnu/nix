{
  lib,
  config,
  ...
}: {
  options = {
    vpn.location = lib.mkOption {
      type = lib.types.enum ["de" "home" "none"];
      default = "none";
      description = "";
    };
  };

  config = lib.mkMerge [
    (lib.mkIf (config.vpn.location == "none") {
      })

    (lib.mkIf (config.vpn.location == "de") {
      networking.wg-quick.interfaces = {
        wg0 = {
          privateKeyFile = "/run/secrets/pk";
          address = ["10.100.0.2/32"];
          dns = ["9.9.9.9"];

          peers = [
            {
              publicKey = "PGFJ+eGfnX4ThpEOGwnnEr/+rqSLViHEWizcTuXjw0A=";
              allowedIPs = ["0.0.0.0/0"];
              endpoint = "45.145.42.193:51820";
            }
          ];
        };
      };
      sops.secrets.pk = {
        owner = "root";
      };
    })

    (lib.mkIf (config.vpn.location == "home") {
      networking.wg-quick.interfaces = {
        wg0 = {
          privateKeyFile = "/run/secrets/pk";
          address = ["10.100.0.2/32"];
          dns = ["9.9.9.9"];

          peers = [
            {
              publicKey = "rv9DmXd2BEYH14YGv6sq34iQpyLRaI8MhVZwszPRkwY=";
              allowedIPs = ["0.0.0.0/0"];
              endpoint = "77.57.190.175:51820";
            }
          ];
        };
      };
      sops.secrets.pk = {
        owner = "root";
      };
    })
  ];
}
