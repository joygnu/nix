{
  pkgs,
  lib,
  config,
  ...
}: let
  vl = pkgs.writeScriptBin "vl" ''
    usage() {
      exit 1
    }

    get_default_sink() {
      ${pkgs.pulseaudioFull}/bin/pactl info | grep "Default Sink" | awk '{print $3}'
    }

    get_default_source() {
      ${pkgs.pulseaudioFull}/bin/pactl info | grep "Default Source" | awk '{print $3}'
    }

    while getopts "dimt" opt; do
      case $opt in
        d)
          sink=$(get_default_sink)
          if [ -n "$sink" ]; then
            ${pkgs.pulseaudioFull}/bin/pactl set-sink-volume "$sink" -10%
          fi
          ;;
        i)
          sink=$(get_default_sink)
          if [ -n "$sink" ]; then
            ${pkgs.pulseaudioFull}/bin/pactl set-sink-volume "$sink" +10%
          fi
          ;;
        m)
          sink=$(get_default_sink)
          if [ -n "$sink" ]; then
            current_mute=$(${pkgs.pulseaudioFull}/bin/pactl get-sink-mute "$sink" | awk '{print $2}')
            if [ "$current_mute" = "yes" ]; then
              ${pkgs.pulseaudioFull}/bin/pactl set-sink-mute "$sink" 0
            else
              ${pkgs.pulseaudioFull}/bin/pactl set-sink-mute "$sink" 1
            fi
          fi
          ;;
        t)
          source=$(get_default_source)
          if [ -n "$source" ]; then
            current_mute=$(${pkgs.pulseaudioFull}/bin/pactl get-source-mute "$source" | awk '{print $2}')
            if [ "$current_mute" = "yes" ]; then
              ${pkgs.pulseaudioFull}/bin/pactl set-source-mute "$source" 0
            else
              ${pkgs.pulseaudioFull}/bin/pactl set-source-mute "$source" 1
            fi
          fi
          ;;
        *)
          usage
          ;;
      esac
    done
  '';
in {
  config = lib.mkIf config.hyprland.enable {
    environment.systemPackages = [vl];
  };
}
