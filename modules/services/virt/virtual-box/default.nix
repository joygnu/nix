{
  lib,
  config,
  username,
  ...
}: {
  options = {
    virtual-box.enable = lib.mkEnableOption "";
  };

  config = lib.mkIf config.virtual-box.enable {
    virtualisation.virtualbox.host = {
      enable = true;
      enableKvm = true;
      addNetworkInterface = false;
    };
    users.extraGroups.vboxusers.members = ["${username}"];
  };
}
