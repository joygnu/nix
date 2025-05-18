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
    hardware.graphics.enable = true;
    environment.systemPackages = with pkgs; [
      lact
    ];
    systemd.services.lact = {
      description = "";
      after = ["multi-user.target"];
      wantedBy = ["multi-user.target"];
      serviceConfig = {
        ExecStart = "${pkgs.lact}/bin/lact daemon";
      };
      enable = true;
    };
  };
}
