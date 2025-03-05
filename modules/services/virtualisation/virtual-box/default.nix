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
    };
    users.extraGroups.vboxusers.members = ["${username}"];
    boot.blacklistedKernelModules = ["kvm" "kvm-intel" "kvm-amd"];
  };
}
