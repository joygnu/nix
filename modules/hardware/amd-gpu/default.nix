{
  lib,
  config,
  pkgs,
  ...
}: {
  options = {
    amd-gpu.enable = lib.mkEnableOption "";
  };

  config = lib.mkIf config.amd-gpu.enable {
    environment.systemPackages = with pkgs; [lact];
    systemd.packages = with pkgs; [lact];
    systemd.services.lactd.wantedBy = ["multi-user.target"];
    hardware.amdgpu.initrd.enable = true;
    hardware.graphics.enable = true;
  };
}
