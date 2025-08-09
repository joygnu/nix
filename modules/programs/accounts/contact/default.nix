{
  username,
  domain,
  lib,
  config,
  ...
}: {
  options = {
    contact.enable = lib.mkEnableOption "";
  };
  config = lib.mkIf config.contact.enable {
    home-manager.users.${username} = {
      programs.vdirsyncer = {
        enable = true;
      };
      programs.khard.enable = true;

      accounts.contact = {
        basePath = ".local/share/contacts";
        accounts.contacts = {
          vdirsyncer.enable = true;
          khard.enable = true;
          remote = {
            type = "carddav";
            url = "https://dav.${domain.a}/${username}/contacts/";
            userName = username;
            passwordCommand = ["cat" "/run/secrets/calendar"];
          };
          local = {
            type = "filesystem";
            fileExt = ".vcf";
            path = "/home/${username}/.local/share/contacts";
          };
        };
      };
    };
  };
}
