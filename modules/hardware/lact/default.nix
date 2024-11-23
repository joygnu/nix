{
  lib,
  config,
  pkgs,
  ...
}: {
  options = {
    lact.enable = lib.mkEnableOption "";
  };

  config = lib.mkIf config.lact.enable {
    environment.systemPackages = with pkgs; [lact];
    systemd.packages = with pkgs; [lact];
    systemd.services.lactd.wantedBy = ["multi-user.target"];
    hardware.amdgpu.initrd.enable = true;
    hardware.graphics.enable = true;
  };
}
