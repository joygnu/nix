{
  pkgs,
  username,
  lib,
  config,
  ...
}: {
  options = {
    vnc.enable = lib.mkEnableOption "";
  };
  config = lib.mkIf config.vnc.enable {
    home-manager.users.${username} = {
      wayland.windowManager.hyprland.settings = {exec-once = ["${pkgs.wayvnc}/bin/wayvnc 0.0.0.0 -g"];};
    };
    networking.firewall.allowedTCPPorts = [5900];
  };
}
