{
  lib,
  config,
  username,
  ...
}: {
  options = {
    vesktop.enable = lib.mkEnableOption "";
  };
  config = lib.mkIf config.vesktop.enable {
    home-manager.users.${username} = {
      programs.nixcord = {
        enable = true;
        discord.enable = false;
        vesktop.enable = true;
        config.plugins.fakeNitro.enable = true;
      };
    };
  };
}
