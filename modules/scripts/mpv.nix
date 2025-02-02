{pkgs, ...}: let
  mpv-url = pkgs.writeScriptBin "mpv-url" ''
    link=$(wl-paste)

    if [ -n "$link" ]; then
        notify-send "Opening Link" "$link"

        error_message=$(mpv "$link" 2>&1)

        if [ $? -ne 0 ]; then
            notify-send "Error" "Failed to open the link with mpv:\n$error_message"
        fi
    else
        notify-send "Error" "No URL provided."
    fi
    i
  '';
in {
  environment.systemPackages = [mpv-url];
}
