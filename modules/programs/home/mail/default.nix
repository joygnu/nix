let
  muttrc = builtins.readFile (./. + "/muttrc");
in {
  accounts.email.accounts = {
    "mail@joygnu.org" = {
      imap.port = 993;
      mbsync.enable = true;
      mbsync.create = "both";
      neomutt = {
        enable = true;
        extraMailboxes = [
          {mailbox = "Sent";}
          {mailbox = "Junk";}
          {mailbox = "Trash";}
          {mailbox = "Drafts";}
        ];
      };
    };
    "spyware@joygnu.org" = {
      imap.port = 993;
      mbsync.enable = true;
      mbsync.create = "both";
      neomutt = {
        enable = true;
        extraMailboxes = [
          {mailbox = "Sent";}
          {mailbox = "Junk";}
          {mailbox = "Trash";}
          {mailbox = "Drafts";}
        ];
      };
    };
    "contact@joygnu.org" = {
      imap.port = 993;
      mbsync.enable = true;
      mbsync.create = "both";
      neomutt = {
        enable = true;
        extraMailboxes = [
          {mailbox = "Sent";}
          {mailbox = "Junk";}
          {mailbox = "Trash";}
          {mailbox = "Drafts";}
        ];
      };
    };
  };
  programs.mbsync = {
    enable = true;
  };

  programs.neomutt = {
    enable = true;
    editor = "hx";
    extraConfig = muttrc;
  };

  imports = [./accounts.nix];
}
