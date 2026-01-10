{
  lib,
  config,
  mail,
  domain,
  inputs,
  ...
}: {
  options = {
    mail-server.enable = lib.mkEnableOption "";
  };

  imports = [inputs.simple-nixos-mailserver.nixosModule];

  config = lib.mkIf config.mail-server.enable {
    mailserver = {
      x509.useACMEHost = "mail.joygnu.org";
      enable = true;
      enableImap = true;
      stateVersion = 3;
      fqdn = "mail.${domain.a}";
      domains = ["${domain.a}"];

      loginAccounts = {
        "${mail.a}@${domain.a}" = {
          hashedPassword = "$2b$05$XhmiJBMBVCvnmHFf5fzVtuCSwDGMQoGyIcxtI2V9PvxjnIK2LNYl2";
          aliases = ["postmaster@${domain.a}" "abuse@${domain.a}"];
        };
        "${mail.b}@${domain.a}" = {
          hashedPassword = "$2b$05$rBFZRiMKymyt/NG9v8ueoeijBeduoqAXB9vGKgeehKNOESpR5DiUm";
        };
        "${mail.c}@${domain.a}" = {
          hashedPassword = "$2b$05$gmrk2/NUcULgiQAAU2CAh.UqQx98TlbIeopWY8JljT8V52djOaHIG";
          aliases = ["@${domain.a}"];
        };
      };
    };

    security.acme.acceptTerms = true;
    security.acme.defaults.email = "${mail.a}@${domain.a}";

    services.roundcube = {
      enable = true;
      hostName = "mail.${domain.a}";
      plugins = [
        "persistent_login"
      ];
      extraConfig = ''
        $config['smtp_server'] = "tls://${config.mailserver.fqdn}";
        $config['smtp_user'] = "%u";
        $config['smtp_pass'] = "%p";
      '';
    };
  };
}
