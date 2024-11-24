{
  lib,
  config,
  ...
}: {
  options = {
    virtual-box.enable = lib.mkEnableOption "";
  };

  config = lib.mkIf config.virtual-box.enable {
    virtualisation.virtualbox.host.enable = true;
  };
}
