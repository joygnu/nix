{
  username,
  mail,
  domain,
  pkgs,
  ...
}: {
  imports = [./mail-sync.nix];
  home-manager.users.${username} = {
    programs.mbsync.enable = true;
    accounts.email = {
      maildirBasePath = ".local/share/mail";

      accounts = {
        "${mail.a}@${domain}" = {
          address = "${mail.a}@${domain}";
          userName = "${mail.a}@${domain}";
          realName = "${username}";
          passwordCommand = "cat /run/secrets/contact";
          imap.host = "mail.${domain}";
          smtp.host = "mail.${domain}";
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
        "${mail.b}@${domain}" = {
          primary = true;
          address = "${mail.b}@${domain}";
          userName = "${mail.b}@${domain}";
          realName = "${username}";
          passwordCommand = "cat /run/secrets/mail";
          imap.host = "mail.${domain}";
          smtp.host = "mail.${domain}";
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
        "${mail.c}@${domain}" = {
          address = "${mail.c}@${domain}";
          userName = "${mail.c}@${domain}";
          realName = "${username}";
          passwordCommand = "cat /run/secrets/spyware";
          imap.host = "mail.${domain}";
          smtp.host = "mail.${domain}";
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
    };
    programs.neomutt = {
      enable = true;
      editor = "hx";
      extraConfig = ''        bind index i noop
        bind pager i noop
        macro index,pager i1 '<sync-mailbox><enter-command>source /home/${username}/.config/neomutt/${mail.a}@${domain}<enter><change-folder>!<enter>;<check-stats>' "switch to ${mail.a}@${domain}"
        macro index,pager i2 '<sync-mailbox><enter-command>source /home/${username}/.config/neomutt/${mail.b}@${domain}<enter><change-folder>!<enter>;<check-stats>' "switch to ${mail.b}@${domain}"
        macro index,pager i3 '<sync-mailbox><enter-command>source /home/${username}/.config/neomutt/${mail.c}@${domain}<enter><change-folder>!<enter>;<check-stats>' "switch to ${mail.c}@${domain}"

        # Sidebar mappings
        set sidebar_visible = yes
        set sidebar_width = 20
        set sidebar_short_path = yes
        set sidebar_next_new_wrap = yes
        set mail_check_stats
        set sidebar_format = '%D%?F? [%F]?%* %?N?%N/? %?S?%S?'
        bind index,pager \Ck sidebar-prev
        bind index,pager \Cj sidebar-next
        bind index,pager \Co sidebar-open
        bind index,pager \Cp sidebar-prev-new
        bind index,pager \Cn sidebar-next-new
        bind index,pager B sidebar-toggle-visible


        color normal white black
        color error brightwhite default
        color status white brightblack
        color sidebar_highlight blue default

        # Default index colors
        color index white black '.*'
        color index_author blue default '.*'
        color index_number blue default
        color index_subject white default '.*'

        # New mail
        color index brightwhite brightblack "~N"
        color index_author brightblue brightblack "~N"
        color index_subject brightwhite brightblack "~N"

        # Tagged mail
        color index brightwhite blue "~T"
        color index_author brightblue blue "~T"
        color index_subject brightwhite blue "~T"

        # Other colors and aesthetic settings
        mono bold bold
        mono underline underline
        mono indicator reverse
        mono error bold
        color indicator brightblack white
        color sidebar_divider brightblack black
        color sidebar_flagged blue black
        color sidebar_new white black
        color normal white default
        color message cyan default
        color markers brightwhite white
        color attachment white default
        color search cyan default
        color hdrdefault brightgreen default

        # Quoted text
        color quoted white default
        color quoted1 blue default
        color quoted2 cyan default
        color quoted3 brightwhite default
        color quoted4 brightblue default
        color quoted5 brightcyan default

        # Signature
        color signature brightgreen default

        # Bold and Underline
        color bold black default
        color underline black default

        bind index,pager g noop
        bind index \Cf noop
        bind index,pager M noop
        bind index,pager C noop

        # General rebindings
        bind index gg first-entry
        bind index j next-entry
        bind index k previous-entry
        bind attach <return> view-mailcap
        bind attach l view-mailcap
        bind index G last-entry
        bind index gg first-entry
        bind pager,attach h exit
        bind pager j next-line
        bind pager k previous-line
        bind pager l view-attachments
        bind index D delete-message
        bind index U undelete-message
        bind index L limit
        bind index h noop
        bind index l display-message
        bind index,query <space> tag-entry
        #bind browser h goto-parent
        macro browser h '<change-dir><kill-line>..<enter>' "Go to parent folder"
        bind index,pager H view-raw-message
        bind browser l select-entry
        bind pager,browser gg top-page
        bind pager,browser G bottom-page
        bind index,pager,browser d half-down
        bind index,pager,browser u half-up
        bind index,pager S sync-mailbox
        bind index,pager R group-reply

        macro index,pager gi "<change-folder>=Inbox<enter>" "go to inbox"
        macro index,pager Mi ";<save-message>=Inbox<enter>" "move mail to inbox"
        macro index,pager Ci ";<copy-message>=Inbox<enter>" "copy mail to inbox"
        macro index,pager gd "<change-folder>=Drafts<enter>" "go to drafts"
        macro index,pager Md ";<save-message>=Drafts<enter>" "move mail to drafts"
        macro index,pager Cd ";<copy-message>=Drafts<enter>" "copy mail to drafts"
        macro index,pager gj "<change-folder>=Junk<enter>" "go to junk"
        macro index,pager Mj ";<save-message>=Junk<enter>" "move mail to junk"
        macro index,pager Cj ";<copy-message>=Junk<enter>" "copy mail to junk"
        macro index,pager gt "<change-folder>=Trash<enter>" "go to trash"
        macro index,pager Mt ";<save-message>=Trash<enter>" "move mail to trash"
        macro index,pager Ct ";<copy-message>=Trash<enter>" "copy mail to trash"
        macro index,pager gs "<change-folder>=Sent<enter>" "go to sent"
        macro index,pager Ms ";<save-message>=Sent<enter>" "move mail to sent"
        macro index,pager Cs ";<copy-message>=Sent<enter>" "copy mail to sent"
        macro index,pager ga "<change-folder>=Archive<enter>" "go to archive"
        macro index,pager Ma ";<save-message>=Archive<enter>" "move mail to archive"
        macro index,pager Ca ";<copy-message>=Archive<enter>" "copy mail to archive"'';
    };
    home.file.".mailcap".text = ''
      text/html; ${pkgs.lynx}/bin/lynx -dump %s; copiousoutput; nametemplate=%s.html
    '';
  };
}
