{
  config,
  lib,
  username,
  ...
}: {
  options = {
    xdg.enable = lib.mkEnableOption "";
  };
  config = lib.mkIf config.xdg.enable {
    home-manager.users.${username} = {
      xdg.userDirs = {
        enable = true;
        download = "/home/${username}/dl";
        desktop = "/home/${username}/dl";
        documents = "/home/${username}/doc";
        music = "/home/${username}/media/music";
        pictures = "/home/${username}/media/pictures";
        videos = "/home/${username}/media/videos";
      };
    };
  };
}
