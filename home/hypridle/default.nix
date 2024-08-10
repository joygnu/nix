{ ... }:
{
  services.hypridle = {
    enable = true;
      settings = {
        general = [
          {
            ignore_dbus_inhibit = false;
          }
        ];
        listener = [
          {
            timeout = 300;
            on-timeout = "hyprctl dispatch dpms off";
            on-resume = "hyprctl dispatch dpms on";
          }
        ];
      };
    };
}
