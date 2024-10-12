{
  accounts.email = {
    maildirBasePath = ".local/share/mail";

    accounts = {
      "mail@joygnu.org" = {
        primary = true;
        address = "mail@joygnu.org";
        userName = "mail";
        realName = "Joy";
        passwordCommand = "cat /run/secrets/mail";
        imap.host = "mail.joygnu.org";
        smtp.host = "mail.joygnu.org";
      };
      "spyware@joygnu.org" = {
        address = "spyware@joygnu.org";
        userName = "spyware";
        realName = "Joy";
        passwordCommand = "cat /run/secrets/spyware";
        imap.host = "mail.joygnu.org";
        smtp.host = "mail.joygnu.org";
      };
      "contact@joygnu.org" = {
        address = "contact@joygnu.org";
        userName = "contact";
        realName = "Joy";
        passwordCommand = "cat /run/secrets/contact";
        # passwordCommand = "sh /home/joy/nix/modules/programs/home/mail/contact.sh";
        imap.host = "mail.joygnu.org";
        smtp.host = "mail.joygnu.org";
      };
    };
  };
}
