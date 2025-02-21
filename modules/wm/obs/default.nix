{
  config,
  lib,
  ...
}: {
  options = {
    obs.enable = lib.mkEnableOption "";
  };
  config = lib.mkIf config.obs.enable {
    programs.obs-studio = {
      enable = true;
      enableVirtualCamera = true;
    };
    boot.extraModulePackages = with config.boot.kernelPackages; [
      v4l2loopback
    ];
    boot.extraModprobeConfig = ''
      options v4l2loopback devices=1 video_nr=1 card_label="OBS Cam" exclusive_caps=1
    '';
    security.polkit.enable = true;
  };
}
