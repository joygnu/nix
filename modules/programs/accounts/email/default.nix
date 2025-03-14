{
  username,
  mail,
  domain,
  lib,
  config,
  pkgs,
  ...
}: {
  options = {
    email.enable = lib.mkEnableOption "";
  };
  config = lib.mkIf config.email.enable {
    home-manager.users.${username} = {
      programs.aerc = {
        enable = true;
        extraConfig = {
          general.unsafe-accounts-conf = true;
          "compose::editor" = {
            "$ex" = "hx";
          };
          "filters" = {
            "text/plain" = "colorize";
            "text/html" = "!${pkgs.w3m}/bin/w3m -I UTF-8 -T text/html";
          };
        };
      };
      home.packages = with pkgs; [
        vim
      ];
      programs.mbsync.enable = true;
      accounts.email = {
        maildirBasePath = ".local/share/mail";

        accounts = {
          "${mail.a}@${domain.a}" = {
            address = "${mail.a}@${domain.a}";
            userName = "${mail.a}@${domain.a}";
            realName = "${username}";
            passwordCommand = "cat /run/secrets/contact";
            imap.host = "mail.${domain.a}";
            smtp.host = "mail.${domain.a}";
            imap.port = 993;
            mbsync.enable = true;
            mbsync.create = "both";
            aerc.enable = true;
          };
          "${mail.b}@${domain.a}" = {
            primary = true;
            address = "${mail.b}@${domain.a}";
            userName = "${mail.b}@${domain.a}";
            realName = "${username}";
            passwordCommand = "cat /run/secrets/mail";
            imap.host = "mail.${domain.a}";
            smtp.host = "mail.${domain.a}";
            imap.port = 993;
            mbsync.enable = true;
            mbsync.create = "both";
            aerc.enable = true;
          };
          "${mail.c}@${domain.a}" = {
            address = "${mail.c}@${domain.a}";
            userName = "${mail.c}@${domain.a}";
            realName = "${username}";
            passwordCommand = "cat /run/secrets/spyware";
            imap.host = "mail.${domain.a}";
            smtp.host = "mail.${domain.a}";
            imap.port = 993;
            mbsync.enable = true;
            mbsync.create = "both";
            aerc.enable = true;
          };
        };
      };
    };
  };
}
