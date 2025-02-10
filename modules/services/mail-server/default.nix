{
  lib,
  config,
  mail,
  domain,
  inputs,
  pkgs-master,
  ...
}: {
  options = {
    mail-server.enable = lib.mkEnableOption "";
  };

  imports = [inputs.simple-nixos-mailserver.nixosModule];

  config = lib.mkIf config.mail-server.enable {
    mailserver = {
      enable = true;
      fqdn = "mail.${domain}";
      domains = ["${domain}"];

      loginAccounts = {
        "mail@${domain}" = {
          hashedPassword = "$2b$05$rBFZRiMKymyt/NG9v8ueoeijBeduoqAXB9vGKgeehKNOESpR5DiUm";
        };
        "contact@${domain}" = {
          hashedPassword = "$2b$05$XhmiJBMBVCvnmHFf5fzVtuCSwDGMQoGyIcxtI2V9PvxjnIK2LNYl2";
          aliases = ["postmaster@${domain}" "abuse@${domain}"];
        };
        "spyware@${domain}" = {
          hashedPassword = "$2b$05$gmrk2/NUcULgiQAAU2CAh.UqQx98TlbIeopWY8JljT8V52djOaHIG";
        };
      };

      certificateScheme = "acme-nginx";
    };

    security.acme.acceptTerms = true;
    security.acme.defaults.email = "${mail}";

    services.roundcube = {
      enable = true;
      package = pkgs-master.roundcube;
      hostName = "mail.${domain}";
      extraConfig = ''
        $config['smtp_server'] = "tls://${config.mailserver.fqdn}";
        $config['smtp_user'] = "%u";
        $config['smtp_pass'] = "%p";
      '';
    };
  };
}
