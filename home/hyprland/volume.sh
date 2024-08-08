#!/bin/sh

# Function to display usage
usage() {
  echo "Usage: $0 [-d|-i|-m]"
  echo "  -d    Decrease volume by 10%"
  echo "  -i    Increase volume by 10%"
  echo "  -m    Toggle mute/unmute"
  exit 1
}

# Get the default sink
sink=$(pactl info | grep "Default Sink" | awk '{print $3}')

# Check if a sink was found
if [ -z "$sink" ]; then
  echo "No default sink found."
  exit 1
fi

# Process command-line options
while getopts "dim" opt; do
  case $opt in
    d)
      # Decrease volume by 10%
      pactl set-sink-volume "$sink" -10%
      ;;
    i)
      # Increase volume by 10%
      pactl set-sink-volume "$sink" +10%
      ;;
    m)
      # Toggle mute/unmute
      current_mute=$(pactl get-sink-mute "$sink" | awk '{print $2}')
      if [ "$current_mute" = "yes" ]; then
        pactl set-sink-mute "$sink" 0
        echo "Unmuted"
      else
        pactl set-sink-mute "$sink" 1
        echo "Muted"
      fi
      ;;
    *)
      usage
      ;;
  esac
done

# Display current volume level
echo "Current volume:"
pactl list sinks | grep -A 15 "$sink" | grep "Volume:"
