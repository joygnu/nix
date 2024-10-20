{
  lib,
  config,
  ...
}: {
  options = {
    hypridle.enable = lib.mkEnableOption "";
  };

  config = lib.mkIf config.hypridle.enable {
    services.hypridle = {
      enable = true;
      settings = {
        listener = [
          {
            timeout = 300;
            on-timeout = "hyprctl dispatch dpms off";
            on-resume = "hyprctl dispatch dpms on";
          }
          {
            timeout = 600;
            on-timeout = "systemctl suspend";
            on-resume = "hyprctl dispatch dpms on";
          }
        ];
      };
    };
  };
}
