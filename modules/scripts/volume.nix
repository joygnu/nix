{pkgs, ...}: let
  vl = pkgs.writeScriptBin "vl" ''
    usage() {
      echo "Usage: $0 [-d|-i|-m|-t]"
      echo "  -d    Decrease volume by 10%"
      echo "  -i    Increase volume by 10%"
      echo "  -m    Toggle mute/unmute for the sink"
      echo "  -t    Toggle mute/unmute for the microphone"
      exit 1
    }

    get_default_sink() {
      pactl info | grep "Default Sink" | awk '{print $3}'
    }

    get_default_source() {
      pactl info | grep "Default Source" | awk '{print $3}'
    }

    while getopts "dimt" opt; do
      case $opt in
        d)
          sink=$(get_default_sink)
          if [ -n "$sink" ]; then
            pactl set-sink-volume "$sink" -10%
          else
            echo "No default sink found."
          fi
          ;;
        i)
          sink=$(get_default_sink)
          if [ -n "$sink" ]; then
            pactl set-sink-volume "$sink" +10%
          else
            echo "No default sink found."
          fi
          ;;
        m)
          sink=$(get_default_sink)
          if [ -n "$sink" ]; then
            current_mute=$(pactl get-sink-mute "$sink" | awk '{print $2}')
            if [ "$current_mute" = "yes" ]; then
              pactl set-sink-mute "$sink" 0
              echo "Unmuted sink"
            else
              pactl set-sink-mute "$sink" 1
              echo "Muted sink"
            fi
          else
            echo "No default sink found."
          fi
          ;;
        t)
          source=$(get_default_source)
          if [ -n "$source" ]; then
            current_mute=$(pactl get-source-mute "$source" | awk '{print $2}')
            if [ "$current_mute" = "yes" ]; then
              pactl set-source-mute "$source" 0
              echo "Unmuted microphone"
            else
              pactl set-source-mute "$source" 1
              echo "Muted microphone"
            fi
          else
            echo "No default source found."
          fi
          ;;
        *)
          usage
          ;;
      esac
    done

    sink=$(get_default_sink)
    if [ -n "$sink" ]; then
      echo "Current volume for sink:"
      pactl list sinks | grep -A 15 "$sink" | grep "Volume:"
    fi
  '';
in {
  environment.systemPackages = [vl];
}
